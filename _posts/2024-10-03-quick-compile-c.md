---
layout: post
title: Quickly Compile Single-Source C/C++ File
date: 2024-10-03
categories: c
---

I am re-learning C and C++ after so many years of coding in Python. To
learn some concepts, I found myself often write a single-source file then
compile it. For example, if I write a `hello.cpp` source, compiling it
will involve something like this:

    g++ -o hello hello.cpp

That is a lot to type (at least to me). I know about `make` and how to
write a `Makefile`, so I often write one to ease my typing.

