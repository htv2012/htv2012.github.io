#!/bin/sh
set -euo pipefail
trap 'echo "Error occurred at line $LINENO"' ERR

source banner.sh

# ======================================================================
install_repo() {
    url="$1"
    dest="$2"
    test -d "$dest" || git clone "$url" "$dest"
}

# ======================================================================
banner Install my
if [ ! -d $HOME/my ]
then
    install_repo git@github.com:htv2012/my.git $HOME/my
    cd "$HOME/my/dotfiles/config" || exit
    for f in *
    do
        if [ -e "$HOME/.config/$f" ]
        then
            mv "$HOME/.config/$f" "$HOME/.config/${f}.original"
        fi
        ln -s "$PWD/$f" "$HOME/.config/$f"
    done
fi

# ======================================================================
banner Install Other projects
mkdir -p ~/Projects
install_repos git@github.com:htv2012/htv2012.github.io.git $HOME/Projects/htv2012.github.io
install_repos git@github.com:htv2012/python-rust-cli.git $HOME/Projects/python-rust-cli
install_repos git@github.com:htv2012/python-sandbox.git $HOME/Projects/python-sandbox
install_repos git@github.com:htv2012/rust-sandbox.git $HOME/Projects/rust-sandbox
install_repos git@github.com:htv2012/snip.git $HOME/Projects/snip
