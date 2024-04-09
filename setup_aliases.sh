#!/bin/bash

# This script sets up git aliases
# Usage: ./setup_aliases.sh [alias1 alias2 ...]
# If no aliases are provided, all aliases are set up

if [ "$#" -eq 0 ]; then
    for file in aliases/*.sh
    do
        source "$file"
    done
else
    for alias in "$@"
    do
        source "aliases/${alias}.sh"
    done
fi