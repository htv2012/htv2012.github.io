#!/bin/sh
#
# Script to run for the first time for each operating system
#

# Determine the distro and return a lower-case string
# Here are some known OSes:
# - On Fedora: fedora
# - On FreeBSD or GhostBSD: freebsd
# - On Linux Mint and LMDE: linuxmint
# - On Mac: darwin
# - On PopOS: pop
# - On Raspbian: raspbian
# - On Ubuntu: ubuntu
get_distro() {
    if [ -f /etc/os-release ]
    then
        # On Linux systems
        sed -n '/^ID=/s/ID=//p' /etc/os-release
    else
        # On systems other than Linux (e.g. Mac or FreeBSD)
        uname
    fi | tr '[:upper:]' '[:lower:]'
}


create_ssh_keys() {
    if [ ! -e ~/.ssh/id_rsa ]
    then
        ssh-keygen -b 4096 -f ~/.ssh/id_rsa -t rsa -N ""
    fi
}

# ======================================================================
# Main
# ======================================================================
cp support/gitconfig $HOME/.gitconfig
create_ssh_keys

distro=$(get_distro)
if ! sh "${distro}/install.sh"
then
    echo "We do not have installation for $distro."
    exit
fi

# Messages should be last so we can read them
cat << EOF
======================================================================

Finished install tools. Please note:

1. Make sure that there are no installation issues
2. For 1Password: Please run the app and log into https://my.1password

Make sure 1Password is installed.
Run it and sign in. You can use the mobile phone to ease setup.

======================================================================
EOF

