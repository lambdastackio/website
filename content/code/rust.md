+++
title = "Rust"
date = "2017-02-20T13:00:20+02:00"
tags = ["Code", "Rust"]
categories = ["code", "rust"]
banner = "img/rust.svg"
author = "Chris Jones"
+++

### `Rust` Programming

A programming language from Heaven! Unlike the language of sorcerers, `Ruby`, `Rust` is a real language that gives you all of the speed and power benefits of `C/C++`, functional model of some scripting languages and true safety that only Rust can provide.

#### C/C++ and Python
I cut my teeth on C and C++ many years ago. I actually won many awards for writing `Best C/C++ Middleware` from Database Advisor Magazine (dating myself). I went on to love `Python` and it soon became my `goto` language. Python is a very good scripting language but it lacks true multi-threaded support (GIL) and strong types. I know, `CPython` can give you good performance and a few other goodies but overall Python has its place as a good dynamic language.

#### Ruby
A number of years ago I remember having a debate with a member of my team that I managed about Ruby. He swore up and down how awesome it was and that I would have to try it to really believe him. Of course, I resisted even looking in the direction of Ruby until I was forced to by my employer due to Chef and Puppet. Since then I have written a number of Ruby custom modules for Chef and yes it's simple but it has really odd syntax that likens itself to ancient symbols you see in horror movies - a sorcery language.

#### Java
Another language that I have had to endure in my career is Java. I remember when Java was introduced (I keep dating myself). It promised so much but it's initial performance was horrible. Since then, of course, the performance has dramatically improved but the verbosity of the code has not gotten any better. Today, it's still used in a number of Enterprises but in a more monolithic nature - old school tech. When I see tech that is Java based, I can't help to immediately think `outdated`. I could go on and on about Java but you get the point.

#### GO
GO is actually a very good systems language. I like it a lot. It was built from ground up to support modern architectures but it too has issues. The compiled code is sort of bloated, it's development dependency management was not really thought out ahead of time (folks have started a `pseudo best practices` which has helped) and it's super easy to hurt yourself at runtime like in C/C++ - just look at Docker. It will compile easily but `easy` compilations can come at a big cost at runtime.

#### Rust
Again, I'm a C/C++ guy at heart. I want everything to run at the speed of light, have no runtime dependencies and have a very small memory footprint. This of course causes all of the languages mentioned thus far to strike out except for C/C++ and GO.

When I first saw `Rust` I thought, "great, another language." I was working with GO and loved it's simple model but found it's development dependency model to be a pain. I wasn't looking at learning a new language but I took a look while sitting in the Orlando airport on my way back to NYC (I know; I spend my time on odd things). For the first hour I was amazed at how simple it was to get Rust installed and how organized the development dependencies were with `Cargo` (Rust's package management system). I was able to build a small app (a little more than Hello World!) before boarding. While on the plane I read more about Rust and thus began my journey.

It wasn't long before I realized that Rust too used some very odd syntax (lifetimes) and I lost even more hair struggling over the `borrower checker`. For Rust to guarantee runtime safety, it must implement tight controls up front during the compilation period. This is completely different than any other programming model so it can take a while to get your head around it. However, once you do, there is no going back. You begin to really appreciate the lifetime management system and how to code in a model that guarantees thread safety etc.

I can happily say I am now `Team Rust` and actually love coding in Rust. I still love Python and do some low-level things in C where needed but my heart is with Rust. Oh, I still have to adorn my black robe in secret and chant `Ruby` while working on my employer's Chef code - necessary evil I suppose!  
