#!/usr/bin/env sh
set -eu

# ======================================================================
install_repo() {
    url="$1"
    dest="$2"

    if [ -d "$dest" ]
    then
        return
    fi

    if ! git clone "$url" "$dest"
    then
        echo "Installation failed for $url to $dest"
        exit
    fi
}

# ======================================================================
if ! [ -d "$HOME/my" ]
then
    install_repo git@github.com:htv2012/my.git "$HOME/my"
    "$HOME/my/bin/link-dotfiles.sh"
fi

# ======================================================================
mkdir -p ~/Projects
install_repo git@github.com:htv2012/htv2012.github.io.git "$HOME/Projects/htv2012.github.io"
install_repo git@github.com:htv2012/python-rust-cli.git "$HOME/Projects/python-rust-cli"
install_repo git@github.com:htv2012/python-sandbox.git "$HOME/Projects/python-sandbox"
install_repo git@github.com:htv2012/rust-sandbox.git "$HOME/Projects/rust-sandbox"
install_repo git@github.com:htv2012/snip.git "$HOME/Projects/snip"
