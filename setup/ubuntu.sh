#!/bin/sh
# ubuntu/install.sh

sh debian apt-apps.sh

# Ubuntu name the bat command as batcat, we want to name it bat instead
mkdir -p "$HOME/.local/bin"
ln -s /usr/bin/batcat "$HOME/.local/bin/bat"

# Locale: needed for Vietnamese language
sudo apt upgrade -y
sh linux/locale.sh

# Joplin
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

# Other apps
sh debian/1password.sh
sh debian/syncthing.sh
sh debian/vscode.sh
sh linux/flatpak-apps.sh
sh linux/rust.sh
sh linux/uv.sh

