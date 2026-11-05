#!/usr/bin/env sh

#
# Setup for BSD (FreeBSD, GhostBSD, MidnightBSD, ...)
#

# Must be root to run
userId=$(id -u)
if [ "$userId" -ne 0 ]
then
	echo Must be root to run this script
    exit
fi

# Install packages
pkg update && pkg upgrade -y
pkg install -y bash
pkg install -y bat
pkg install -y eza
pkg install -y fzf
pkg install -y git
pkg install -y git-delta
pkg install -y gmake
pkg install -y python
pkg install -y ripgrep
pkg install -y rust
pkg install -y stow
pkg install -y syncthing
pkg install -y tailscale
pkg install -y tmux
pkg install -y tree
pkg install -y vim
pkg install -y vscode
pkg install -y zellij
pkg install -y zsh

# Symbolic links
makeDir="$(dirname $(which gmake))"
ln -s "${makeDir}/gmake" "${makeDir}/make"

# Configure git
git config --global user.email "haivu2004@gmail.com"
git config --global user.name "Hai Vu"
git config --global init.defaultBranch main
git config --global pull.rebase true

