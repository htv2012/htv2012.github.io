#!/bin/sh

# linux/uv.sh

curl -LsSf https://astral.sh/uv/install.sh | sh

PATH=$HOME/.local/bin:$PATH
uv tool install copier
