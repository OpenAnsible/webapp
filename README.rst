OpenAnsible Web Application
=================================

:Date: 05/12 2016

.. contents::

介绍
-----------

运行在浏览器上面的 `OpenAnsible Web` 应用。


Install
----------------------------

**安装Elm:**

Mac OS X 系统:

.. code:: bash
    
    brew install elm

其它系统以及安装方式: `More <http://elm-lang.org/install>`_


**安装Slimit:**


    `Slimit` 是基于 `Python` 编写的用于压缩 `JavaScript` 代码库。


.. code:: bash
    
    pip2 install slimit



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


参考
-------

*   `Elm Documentation <http://elm-lang.org/docs>`_
*   `Elm Community <http://elm-lang.org/community>`_
*   `Elm Example <http://elm-lang.org/examples>`_
*   `Elm Package <http://package.elm-lang.org/>`_

*   `Elm Tutorial <http://www.elm-tutorial.org/>`_
*   `An Introduction to Elm <https://www.gitbook.com/book/evancz/an-introduction-to-elm/details>`_

