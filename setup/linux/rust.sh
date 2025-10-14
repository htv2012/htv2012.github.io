#!/bin/sh

# Install Rust and tools

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
PATH=$HOME/.cargo/bin:$PATH

which eza || cargo install eza
which delta || cargo install git-delta
which http || cargo install httpie
which rg || cargo install ripgrep
