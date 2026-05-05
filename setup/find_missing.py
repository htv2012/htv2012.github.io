#!/usr/bin/env python3
import shutil


def is_missing(names: list[str]) -> bool:
    return not any(shutil.which(name) for name in names)


def main():
    tools = [
        ("bat", "batcat"),
        ("cc",),
        ("clang",),
        ("clang-format",),
        ("copier",),
        ("delta",),
        ("eza",),
        ("fzf",),
        ("gcc",),
        ("http",),
        ("https",),
        ("jq",),
        ("rg",),
        ("ssh",),
        ("tree",),
        ("uv",),
    ]

    for tool_set in tools:
        if is_missing(tool_set):
            print(" or ".join(tool_set))


if __name__ == "__main__":
    main()
