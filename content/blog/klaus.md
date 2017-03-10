+++
title = "Klaus - Hybrid WebStack"
date = "2017-01-15T15:00:00+02:00"
tags = ["web", "S3", "api", "redis"]
categories = ["web", "s3"]
banner = "img/klaus-avatar.png"
author = "Chris Jones"
+++

There are very good Web Servers on the market, Apache and NGINX to name a few. However, to interface your backend code you need to use Apache modules or WSGI/FastCGI with NGINX (depending on your language of choice). To actually use a fully integrated environment you need to use something like Django or Tornado for Python. For GO there is a small built-in web server that allows you to build up a more robust environment around it. But for Rust, not so much - until now.

My original goto languages of choice were C/C++ and then some time ago I switched to Python as my first choice. But, after working with Rust this past year, there is no way I would go back. Rust gives me an environment with no runtime dependencies with the speed of optimized C/C++ code but with safety guarantees. This makes deploying code written in Rust as simple as moving an executable around. Contrast that with Python, Ruby or Java where you can easily spend more time making sure the dependencies are in place than actually writing the code in some cases.

As wonderful as Rust is there are a few missing pieces, a built-in default web server code to build on. However, there are several great projects that allow for powerful async I/O in a multi-threaded model that have guaranteed safety. One such project is called Klaus-rs. Klaus has not reached it's 1.0 status but is very close. It's what I call a full "hybrid model" which means it can run as a stand-alone Web Server that serves static pages as well as single page Javascript apps like React or Angular without any funky configuration changes. It just works out of the box so to speak. Klaus also works as an Agent model where it can reside in a background process to handle requests from other agents and initiate requests instead of simply responding to requests. It also has RESTful features built-in so setting up APIs are very simple and it will soon support built-in rate limiting via it's built-in support for Redis.

One of the greatest and simplest features is the built-in support for AWS S3. This means that it can support making S3 calls using your own AWS credentials. You don't have to create a funky piece of code and bolt it on to handle automatic uploads to S3 for example. Since it's built in Rust and most of the code resides in a library, you can easily extend it to support your environment. The memory footprint is very small so running in a Docker container is also an ideal solution.

Why call it Klaus? The name is based off of a fictional character from the TV series called The Originals. In the series, Klaus is one of the first Vampires but what makes him so lethal is the fact that he is also part Werewolf making him a true hybrid that can survive anything. So, Klaus-rs can survive any distributed environment including Silver and Daylight!

To get started, simply fork the github project at https://github.com/klaus-rs/klaus and start building. This of course assumes you have Rust installed if you plan on building it from source. To install Rust go to https://rustup.rs and follow the instructions.
