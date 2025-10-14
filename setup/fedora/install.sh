# Add vscode repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
{
    echo "[code]"
    echo "name=Visual Studio Code"
    echo "baseurl=https://packages.microsoft.com/yumrepos/vscode"
    echo "enabled=1"
    echo "gpgcheck=1"
    echo "gpgkey=https://packages.microsoft.com/keys/microsoft.asc"
} | sudo tee /etc/yum.repos.d/vscode.repo

sudo dnf check-update
sudo dnf update -y

sudo dnf install -y bat
sudo dnf install -y code
sudo dnf install -y eza
sudo dnf install -y fzf
sudo dnf install -y git-delta
sudo dnf install -y gnome-shell-extension-gpaste
sudo dnf install -y google-chrome
sudo dnf install -y gpaste
sudo dnf install -y kitty
sudo dnf install -y levien-inconsolata-fonts
sudo dnf install -y make
sudo dnf install -y ripgrep
sudo dnf install -y tmux
sudo dnf install -y yum-utils
sudo dnf install -y zsh

flatpak install -y stimulator
ssh-import-id gh:htv2012

# 1Password
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf install -y 1password

# Joplin
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

# uv
curl -LsSf https://astral.sh/uv/install.sh | sh

