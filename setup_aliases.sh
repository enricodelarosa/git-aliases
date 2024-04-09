#!/bin/bash

# This script sets up git aliases
# Usage: ./setup_aliases.sh [alias1 alias2 ...]
# If no aliases are provided, all aliases are set up

# Check the operating system
OS=$(uname)

# Install yq if not already installed
if ! command -v yq &> /dev/null
then
    echo "yq could not be found, installing..."
    if [ "$OS" == "Darwin" ]; then # Mac OS
        brew install yq
    elif [ "$OS" == "MINGW64_NT-10.0" ]; then # Windows
        winget install --id MikeFarah.yq
    else
        echo "Unsupported operating system. Please install yq manually."
        exit 1
    fi
fi

# Read aliases from YAML files and set them
if [ "$#" -eq 0 ]; then
    for file in aliases/*.yml
    do
        alias=$(yq e '.alias' "$file")
        command=$(yq e '.command' "$file")
        git config --global alias.$alias "$command"
    done
else
    for alias_file in "$@"
    do
        alias=$(yq e '.alias' "aliases/${alias_file}.yml")
        command=$(yq e '.command' "aliases/${alias_file}.yml")
        git config --global alias.$alias "$command"
    done
fi