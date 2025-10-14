#!/bin/sh

# ======================================================================
# Install my
# ======================================================================
cd || exit
test -d ~/my || git clone git@github.com:htv2012/my.git
cd "$HOME/my/dotfiles/config" || exit
for f in *
do
    if [ -e "$HOME/.config/$f" ]
    then
        mv "$HOME/.config/$f" "$HOME/.config/${f}.original"
    fi
    ln -s "$PWD/$f" "$HOME/.config/$f"
done

# ======================================================================
# Install Other projects
# ======================================================================
mkdir -p ~/Projects
cd ~/Projects || exit

while read -r url
do
    repoDir="$(basename ${url%.git})"
    if [ -d "$repoDir" ]
    then
        echo "Skip $repoDir"
    else
        echo "Clone $repoDir"
        git clone "$url"
    fi
done < support/repos.txt
