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
write a `Makefile`, so I often write one to ease my typing:

    # Makefile
    hello: hello.cpp

Then to compile, I can issue one of these commands:

    make
    make hello

All is good at this point. However, after a while, even writing a simple
`Makefile` gets tedious. It turns out that `make` knows how to compile a
C or C++ source, even without the help of a `Makefile`. That simplifies
my workflow quite a bit, which is now involves:

1. Write the source, say `hello.cpp`
2. Compile and run:

        make hello && ./hello

3. Go back to step 1 to fix or improve the code and repeat

For those times that I need a little more than just write the program
and run, I will turn back to the trusty `Makefile`, but for most of my
learning scenarios, the above workflow works well for me.


