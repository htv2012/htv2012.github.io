#!/bin/sh

# Ensure tools are available
if ! which curl > /dev/null
then
    echo Make sure curl is available
    exit
fi

# Create and cd temp dir
cd || exit
root=$(mktemp --directory --tmpdir=$HOME github-setup-XXXX) || exit
cd "$root" || exit

# Download
echo Downloading setup.tar...
curl https://htv2012.github.io/setup.tar -o setup.tar
tar -xf setup.tar

echo "Files are downloaded to $root"
