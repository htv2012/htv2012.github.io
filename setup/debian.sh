install_apps() {
    sudo apt update
    sudo apt upgrade -y
    sudo add-apt-repository universe

    sudo apt install -y \
        apt-transport-https \
        bat \
        bruno \
        build-essential \
        curl \
        curl \
        eza \
        flatpak \
        fonts-inconsolata \
        fzf \
        git \
        git-delta \
        gnome-shell-extension-gpaste \
        gpaste \
        httpie \
        jq \
        libfuse2 \
        make \
        make \
        openssh-server \
        python3-venv \
        ripgrep \
        tmux \
        xsel \
        zsh
}

install_syncthing() {
    # Add the release PGP keys:
    sudo mkdir -p /etc/apt/keyrings
    sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg

    # Add the "stable" channel to your APT sources:
    echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

    # Update and install syncthing:
    sudo apt-get update
    sudo apt-get install -y syncthing
}

install_1password() {
    # Add key to apt repository
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg


     # Add 1password apt repository
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list

    # Add the debsig-verify policy
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

    # Install
    sudo apt update && sudo apt install -y 1password
}

install_vscode() {
    set -e
    sudo apt install -y wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
    rm -f packages.microsoft.gpg

    sudo apt install -y apt-transport-https
    sudo apt update
    sudo apt install -y code # or code-insiders
}

install_extras() {
    # zed
    curl -f https://zed.dev/install.sh | sh

    # joplin
    wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash
}

create_ssh_keys() {
    if [ ! -e ~/.ssh/id_rsa ]
    then
        ssh-keygen -b 4096 -f ~/.ssh/id_rsa -t rsa -N ""
    fi
}

setup_git_config() {
    git config --global user.email "haivu2004@gmail.com"
    git config --global user.name "Hai Vu"
    git config --global init.defaultBranch main
    git config --global pull.rebase true
}


# ======================================================================
# main
# ======================================================================
install_apps
install_syncthing
install_1password
install_vscode
install_extras
create_ssh_keys
setup_git_config

