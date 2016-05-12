OpenAnsible Web Application
=================================

:Date: 05/12 2016

.. contents::

介绍
-----------

运行在浏览器上面的 `OpenAnsible Web` 应用。


运行&部署
-----------

*   使用诸如 `Nginx` 等高性能 `Web Server` 来做静态文件服务器，将 `Nginx` 中 `Location Root` 指向 `src` 目录即可。

::

    location / {
        root        webapp/src;
        autoindex   on;
    }


*   使用 `Python` 自带的 `SimpleHTTPServer` 模块来做 静态文件服务器（适合测试开发使用）。

.. code:: bash
    
    cd webapp/src
    bash run.sh



技术
-----------

*   `JQuery <https://jquery.com/>`_ , A fast, small, and feature-rich JavaScript library. It makes things like HTML document traversal and manipulation, event handling, animation, and Ajax much simpler with an easy-to-use API that works across a multitude of browsers
*   `React <https://facebook.github.io/react/>`_ , A JavaScript Library For Building User Interfaces
*	`WebRTC adapter <https://github.com/webrtc/adapter>`_ , A shim to insulate apps from spec changes and prefix differences.
*   `WebRTC <https://webrtc.org/>`_ , A free, open project that provides browsers and mobile applications with Real-Time Communications (RTC) capabilities via simple APIs

