#!/usr/bin/env python3
"""
Create the download script
"""

import pathlib

PROLOGUE = """#!/usr/bin/env sh

# Ensure tools are available
if ! which curl > /dev/null
then
    echo Make sure curl is available
    exit
fi

# Create and navigate to setup dir
mkdir "$HOME/setup" || exit
cd "$HOME/setup" || exit
"""

EPILOGUE = """

echo # ======================================================================
echo # Setup is available at $HOME/setup
echo # ======================================================================

"""


def main():
    """Entry"""
    print(PROLOGUE)

    parent_dir = pathlib.Path(__file__).parent.parent

    for file in parent_dir.rglob("*"):
        if "/." in str(file):
            continue

        file = file.relative_to(parent_dir)
        if file.is_dir():
            print(f'mkdir -p "{file}"')
        else:
            print(f"curl -s --output {file} https://htv2012.github.io/setup/{file}")

    print(EPILOGUE)


if __name__ == "__main__":
    main()
