#!/usr/bin/env sh
userId=$(id -u)
if [ "$userId" -ne 0 ]; then
	echo Must be root to run this script
    exit
fi

echo Installing tools
pkg update && pkg upgrade -y
pkg install -y bash
pkg install -y bat
pkg install -y eza
pkg install -y fzf
pkg install -y git
pkg install -y git-delta
pkg install -y python
pkg install -y ripgrep
pkg install -y stow
pkg install -y syncthing
pkg install -y tailscale
pkg install -y tmux
pkg install -y tree
pkg install -y vim
pkg install -y zsh

