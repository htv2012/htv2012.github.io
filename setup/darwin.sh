#!/usr/bin/env bash
set -euo pipefail
trap 'echo "Error occurred at line $LINENO"' ERR
source banner.sh

# ======================================================================
banner SSH Keys Generation
ssh-keygen  -f ~/.ssh/id_rsa -t ed25519 -N ""

# ======================================================================
banner Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# ======================================================================
banner Install  Brew Apps
brew install -y 
    1password-cli \
    bat \
    bruno-cli \
    copier \
    copier \
    csview \
    eza \
    font-inconsolata \
    fzf \
    gh \
    git \
    git-delta \
    hatch \
    httpie \
    jq \
    multipass \
    podman \
    rename \
    ripgrep \
    syncthing \
    tree \
    watch \

brew install -y --cask 
    1password \
    joplin \
    visual-studio-code \

# ======================================================================
banner Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# ======================================================================
banner Install macOS Development Tools
xcode-select --install

# ======================================================================
banner Configure Git
git config --global user.email "haivu2004@gmail.com"
git config --global user.name "Hai Vu"
git config --global init.defaultBranch main
git config --global pull.rebase true
