OpenAnsible Web Application
=================================

:Date: 05/12 2016

.. contents::

介绍
-----------

运行在浏览器上面的 `OpenAnsible Web` 应用。

编译 React JS 代码
-----------------------
对于 `ReactJS` 代码，我们采用了 `Babel` 来进行实时编译成 `JavaScript` 。

安装 `Babel` 编译器:

.. code:: bash
	
	cd webapp/src/assets/react/
	# babel-preset-stage-0, babel-preset-stage-1, babel-preset-stage-2, babel-preset-stage-3
	npm install babel babel-cli babel-core babel-preset-react babel-preset-es2015 babel-polyfill


实时编译 React 代码:

.. code:: bash

	cd webapp/src
	./jsx.sh


**Node包位置问题:**

如果你已经安装过了 `babel`, `babel-core`, `babel-preset-react` ... 等系列包，
并且是 安装在了 全局目录（ `npm install -g` ，一般来说 包会在 `/use/local/lib/node_modules`目录 ），
那么你需要在本地目录建立一个软连接（ `Node.js` 在后续版本当中不支持全局包，你必须安装在本地才可以使用 ）.

.. code:: bash
	
	cd webapp/src/assets/react/
	ln -s /usr/local/lib/node_modules .
	# 删除该软连接
	# rm node_modules


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
    python -m SimpleHTTPServer
    # Or 
    bash run.sh



技术
-----------

*   `JQuery <https://jquery.com/>`_ , A fast, small, and feature-rich JavaScript library. It makes things like HTML document traversal and manipulation, event handling, animation, and Ajax much simpler with an easy-to-use API that works across a multitude of browsers
*   `React <https://facebook.github.io/react/>`_ , A JavaScript Library For Building User Interfaces
*	`WebRTC adapter <https://github.com/webrtc/adapter>`_ , A shim to insulate apps from spec changes and prefix differences.
*   `WebRTC <https://webrtc.org/>`_ , A free, open project that provides browsers and mobile applications with Real-Time Communications (RTC) capabilities via simple APIs

