# Development Environment Configuration

Modular ZSH and Vim configurations for macOS and Linux with machine-specific customization support.

## Quick Start

```bash
# clone this repo to /projects/dev-environment
cd ~/projects/dev-environment
./install.sh
```

The installer backs up existing configs, creates symlinks, and prompts for your machine type.

## Key Features

- **Custom keybindings** (see `zsh/widgets.zsh` - ⚠️ some override defaults)
- **Git workflow functions**: `update-main` (alias: `gum`), `backup-branch`, `reset-branch-to-origin`, `rebase-on`
- **Enhanced shell history**: 10M line buffer, timestamps, shared across sessions
- **Machine-specific configs**: Set `MACHINE` variable in `.zshrc` to load appropriate paths/tools

## Required Dependencies

Install these before using:

- [Oh-My-Zsh](https://ohmyz.sh/)
- [zsh-completions plugin](https://github.com/zsh-users/zsh-completions)
- [fzf](https://github.com/junegunn/fzf) (fuzzy finder)
- [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) (ag)
- **Linux only**: `xclip` for clipboard support

## Optional Tools

Install based on your needs (see machine configs for what's included):

- [pyenv](https://github.com/pyenv/pyenv)
- [poetry](https://python-poetry.org/)
- [fnm](https://github.com/Schniz/fnm) (Node version management)
- [SDKMAN](https://sdkman.io/)
- [AWS CLI](https://aws.amazon.com/cli/)
- [Homebrew](https://brew.sh/)
  - **Homebrew multi-user issues**: See [this guide](https://www.codejam.info/2021/11/homebrew-multi-user.html). Note: `brew` alias in `zsh/aliases.zsh` runs as user `nickengelhardt` - modify as needed. 

## Keybinding Conflicts

Custom keybindings that override ZSH defaults (see `zsh/widgets.zsh` to disable):

| Key | Custom | Default | Line to Comment |
|-----|--------|---------|-----------------|
| Ctrl+W | Copy pwd to clipboard | Delete word | 7-8 |
| Ctrl+F | Toggle sudo | Move forward char | 19-20 |
| Ctrl+D | Delete next word | Delete char/exit | 26 |
| Ctrl+S | Forward history search | Stop output | 31 |
