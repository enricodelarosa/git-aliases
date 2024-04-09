# Git Aliases

This repository contains a collection of git aliases to simplify your git commands and easily migrate them to a new machine

## Setup

To set up the git aliases on a new machine, follow these steps:

1. Clone the repository
2. Navigate into the repository
3. Make the script executable: `chmod +x setup_aliases.sh`
4. Run the script with the aliases you want: `./setup_aliases.sh commit_m`

If no aliases are specified when running the script, all aliases are set up. When specifying the aliases, use the filename without the `.yml` extension.

## Adding New Aliases

To add a new alias, create a new YAML file in the `aliases` directory with the alias and the command. For example:

```yaml
alias: co
command: checkout