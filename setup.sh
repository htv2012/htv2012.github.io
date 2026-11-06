#!/usr/bin/env sh

# Ensure tools are available
if ! which curl > /dev/null
then
    echo Make sure curl is available
    exit
fi

# Create and navigate to setup dir
mkdir "$HOME/setup" || exit
cd "$HOME/setup" || exit

curl -s --output debian.sh https://htv2012.github.io/setup/debian.sh
curl -s --output repos.sh https://htv2012.github.io/setup/repos.sh
curl -s --output index.html https://htv2012.github.io/setup/index.html
curl -s --output fedora.sh https://htv2012.github.io/setup/fedora.sh
curl -s --output Makefile https://htv2012.github.io/setup/Makefile
curl -s --output bsd.sh https://htv2012.github.io/setup/bsd.sh
curl -s --output darwin.sh https://htv2012.github.io/setup/darwin.sh
curl -s --output ubuntu.sh https://htv2012.github.io/setup/ubuntu.sh
curl -s --output find_missing.py https://htv2012.github.io/setup/find_missing.py
curl -s --output banner.sh https://htv2012.github.io/setup/banner.sh
curl -s --output README.md https://htv2012.github.io/setup/README.md
mkdir -p "support"
mkdir -p "linux"
curl -s --output support/add-haiv.sh https://htv2012.github.io/setup/support/add-haiv.sh
curl -s --output support/configuration.nix https://htv2012.github.io/setup/support/configuration.nix
curl -s --output support/gitconfig.txt https://htv2012.github.io/setup/support/gitconfig.txt
curl -s --output support/create_download_script.py https://htv2012.github.io/setup/support/create_download_script.py
curl -s --output support/after_setup_tasks.md https://htv2012.github.io/setup/support/after_setup_tasks.md
curl -s --output linux/locale.sh https://htv2012.github.io/setup/linux/locale.sh
curl -s --output linux/flatpak-apps.sh https://htv2012.github.io/setup/linux/flatpak-apps.sh
curl -s --output linux/uv.sh https://htv2012.github.io/setup/linux/uv.sh
curl -s --output linux/rust.sh https://htv2012.github.io/setup/linux/rust.sh


echo "======================================================================"
echo "Setup is available at $HOME/setup"
echo "======================================================================"


