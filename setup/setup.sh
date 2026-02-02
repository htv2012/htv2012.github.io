#!/bin/sh

if which wget 2> /dev/null > /dev/null
then
    echo wget found
    wget -P /tmp 'https://htv2012.github.io/setup.tar'
fi
