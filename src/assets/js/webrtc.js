'use strict';

// 视频/音频 硬件资源控制
// 注: 应该采用 `navigator.mediaDevices.enumerateDevices` 里面的 底层API 来决定控制哪个硬件。
// var input = navigator.mediaDevices.getUserMedia({
//   "audio": true, "video": {"width": 400, "height": 400}
// });
// input.then(function (stream){
//     localVideo.src = window.URL.createObjectURL(stream);
//     // pc1.addStream(stream);
// });

// input.catch(function (error){
//     console.error(error);
// });


function WebRTC(ice_server){
    this.name    = "WebRTC";
    this.version = "0.1";


    this.ice_server = ice_server || null;
    this.devices    = [];
    this.connection = null;
    // 初始化数据
    this.init();
}
WebRTC.prototype.init = function (){
    this.get_media_devices();
    this._new_peer_connection();
    this._create_sdp();
};
WebRTC.prototype.get_media_devices = function (){
    var self    = this;
    if (self.devices.length > 0) {
        return self.devices;
    }
    navigator.mediaDevices.enumerateDevices().then(function (media_devices){
        // NOTE: Devices 数据结构需要改成对象，
        //       用户根据 this.devices[0].take_picture() 之类的 API 来获取硬件资源.
        self.devices = media_devices.map(function (device){
            return {
                "deviceId": device.deviceId,
                "groupId" : device.groupId,
                "kind"    : device.kind,
                "label"   : device.label
            };
        });
    }).catch(function (error){
        // devices = []
    });
    // Note: 以上代码的 `then` 使用异步调用了底层 API，所以此处无法 return 回去列表。
};
WebRTC.prototype._new_peer_connection = function (){
    this.connection = new RTCPeerConnection(this.ice_server);
    // add event
    this.connection.onaddstream = this.onaddstream;

};
WebRTC.prototype._create_sdp = function (){
    // createOffer
    if ( this.connection == null ) {
        throw new Error("...");
    }
    var self = this;
    var offerOptions = {
      // New spec states offerToReceiveAudio/Video are of type long (due to
      // having to tell how many "m" lines to generate).
      // http://w3c.github.io/webrtc-pc/#idl-def-RTCOfferAnswerOptions.
      offerToReceiveAudio:  1,
      offerToReceiveVideo: 1,
      iceRestart: true,
      voiceActivityDetection: true
    };
    this.connection.createOffer(offerOptions).then(function (desc){
        self.connection.setLocalDescription(desc);
        console.log(desc);
    }).catch(function (error){
        console.error("创建 SDP 信息失败！");
        console.error(error);
    });
};

// Bind Event
WebRTC.prototype.onaddstream = function (evt){
    // evt: { stream: stream }

};
