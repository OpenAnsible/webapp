
use std::fs::File;
use std::boxed::Box;
use std::io::{Read, Write};
use std::thread;
use std::net::{TcpListener}; // TcpStream
use std::str::from_utf8;

// 编译
//      brew install rust
//      rustc main.rs
//      ./main

static SERVER_ERROR: &'static str = "HTTP/1.1 500 Server Error\r\n\
Server: Rust\r\n\
Content-Type: text/html\r\n\
Content-Length: 18\r\n\r\n\
Server Error - 500";


fn main() {
    let address = "0.0.0.0:8000";
    let listener = TcpListener::bind(address).unwrap();
    
    println!("HTTP Server running on {}", address);

    // index.html
    // let response = match File::open("index.html") {
    //     Ok(mut file) => {
    //         let mut body = String::new();
    //         let _ = file.read_to_string(&mut body);
    //         format!("HTTP/1.1 200 OK\r\n\
    //             Server: Rust/1.0\r\n\
    //             Content-Type: text/html\r\n\
    //             Content-Length: {}\r\n\r\n\
    //             {}", body.len(), body)
    //     },
    //     Err(e) => {
    //         SERVER_ERROR.to_string()
    //     }
    // };

    
    // let body = Box::new(response);
    // accept connections and process them, spawning a new thread for each one
    for stream in listener.incoming() {
        // let body_clone = body.clone();
        match stream {
            Ok(mut stream) => {
                thread::spawn(move|| {
                    let mut buff = [0u8; 4096];
                    match stream.read(&mut buff){
                        Ok(size) => {
                            let request = from_utf8(&buff[0..size]).unwrap();
                            
                            if request.starts_with("GET /assets") {
                                let filename = ".".to_string() 
                                             + request.split(" ").collect::<Vec<&str>>()[1];
                                println!("Request: GET {}", filename);
                                let content = match File::open(&filename) {
                                    Ok(mut file) => {
                                        let mut body = String::new();
                                        let _ = file.read_to_string(&mut body);
                                        body
                                    },
                                    Err(e) => {
                                        println!("Error: {:?}", e);
                                        stream.write_all(SERVER_ERROR.as_bytes());
                                        return;
                                    }
                                };
                                stream.write_all(content.as_bytes());
                                return;
                            }
                            println!("{:?} -> {:?}", stream.peer_addr().unwrap(), 
                                                     stream.local_addr().unwrap() );
                            let index_html = match File::open("index.html") {
                                Ok(mut file) => {
                                    let mut body = String::new();
                                    let _ = file.read_to_string(&mut body);
                                    format!("HTTP/1.1 200 OK\r\n\
                                        Server: Rust/1.0\r\n\
                                        Content-Type: text/html\r\n\
                                        Content-Length: {}\r\n\r\n\
                                        {}", body.len(), body)
                                },
                                Err(e) => {
                                    SERVER_ERROR.to_string()
                                }
                            };
                            stream.write_all(index_html.as_bytes());
                        },
                        Err(e) => {
                            println!("Error: {:?}", e);
                            stream.write_all(SERVER_ERROR.as_bytes());
                        }
                    };
                });
            }
            Err(e) => {
                println!("Error: connection failed {:?}", e);
            }
        }
    }
    
    // close the socket server
    drop(listener);
}
