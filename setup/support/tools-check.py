#!/usr/bin/env python3
import os
import subprocess


def tool_missing(name: str) -> bool:
    """
    Detect if tool is not installed.

    We don't use shutil.which because it does not detect aliases.
    """
    shell = os.getenv("SHELL")
    if shell is None:
        return 

    rc_script = os.path.expanduser(f"~/.{os.path.basename(shell)}rc")
    if os.path.exists(rc_script):
        command = [shell, "-c", f". {rc_script}; type {name}"]
    else:
        command = [shell, "-c", f"type {name}"]

    completed_process = subprocess.run(
        command,
        capture_output=True,
        check=False,
    )
    return completed_process.returncode != 0


tools = {
    "bat": "bat",
    "batcat": "bat command",
    "cc": "cc",
    "clang": "clang",
    "clang-format": "clang-format",
    "copier": "copier",
    "delta": "delta",
    "eza": "eza",
    "fzf": "fzf",
    "gcc": "gcc",
    "http": "httpie",
    "https": "httpie",
    "jq": "jq",
    "rg": "ripgrep",
    "ssh": "ssh",
    "tilix": "tilix",
    "tree": "tree",
    "uv": "uv",
}

missing = {description for tool, description in tools.items() if tool_missing(tool)}
if missing:
    print("\n# Tools we need to install")
    print("\n".join(missing))
