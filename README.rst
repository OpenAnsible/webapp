OpenAnsible Web Application
=================================

:Date: 05/12 2016

.. contents::

介绍
-----------

运行在浏览器上面的 `OpenAnsible Web` 应用。


Install
----------------------------

Mac OS X 系统:

.. code:: bash
    
    brew install elm

其它系统以及安装方式:

More: `Install <http://elm-lang.org/install>`_

安装完成之后，在命令行里面输入:

.. code:: bash

    elm
    elm-make
    elm-package
    elm-reactor
    elm-doc
    elm-repl


如果上述命令都存在，那恭喜你，安装完成了～


Compile
---------------

通过 `Makefile` 来编译:

.. code:: bash
    
    cd webapp;
    make

通过原生方法编译:

.. code:: bash

    cd webapp;
    # Or elm-make src/Main.elm
    elm make src/Main.elm --output=./assets/js/elm.js
    # Compress JavaScript Code
    slimit ./assets/js/elm.js > ./assets/js/elm.min.js


Develop
--------

.. code:: bash

    cd webapp
    # elm-reactor
    elm reactor


技术
-----------

*   `Elm <http://elm-lang.org/>`_ , The best of functional programming in your browser
*   `WebRTC adapter <https://github.com/webrtc/adapter>`_ , A shim to insulate apps from spec changes and prefix differences.
*   `WebRTC <https://webrtc.org/>`_ , A free, open project that provides browsers and mobile applications with Real-Time Communications (RTC) capabilities via simple APIs
