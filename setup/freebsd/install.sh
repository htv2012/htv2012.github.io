    echo Setting up FreeBSD

    # Update and Install Packages
    pkg update && pkg upgrade -y
    pkg install -y bat
    pkg install -y eza || pkg install -y exa
    pkg install -y git
    pkg install -y git-delta
    pkg install -y python
    pkg install -y ripgrep
    pkg install -y tmux
    pkg install -y tree
    pkg install -y vim
    pkg install -y zsh || pkg install -y bash

    # Provision a user
    pw useradd haiv -G wheel -s /usr/local/bin/zsh -m
    mkdir ~haiv/.ssh
    cp ~/.ssh/authorized_keys ~haiv/.ssh
    chmod 600 ~haiv/.ssh/authorized_keys
    chown -R haiv ~haiv/.ssh
    echo "haiv ALL=(ALL) NOPASSWD:ALL" > /usr/local/etc/sudoers.d/haiv
