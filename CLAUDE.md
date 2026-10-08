# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal development environment configuration repository for managing shell configurations, vim settings, and machine-specific environment variables across different systems (macOS and Linux). The repository uses symlinks to install configurations from the repo to the home directory.

A unified `install.sh` script handles installation of both ZSH and Vim configurations, and prompts the user to select their machine type.

## Architecture

### Modular ZSH Configuration

The ZSH configuration is split into multiple modular files that are sourced in a specific order in `zsh/.zshrc`:

1. **zsh_settings.zsh** - Core ZSH settings (theme, history, plugins, completions)
2. **widgets.zsh** - Custom ZSH widgets and keybindings
3. **oh-my-zsh.sh** - Oh-my-zsh framework initialization
4. **aliases.zsh** - Command aliases
5. **functions.zsh** - Custom shell functions

The main `.zshrc` file sources these modules and sets up environment-specific tools (pyenv, poetry, sdkman, fnm, aws-cli).

### Machine-Specific Configuration

- **macbook/** and **xps13/** directories contain machine-specific configuration files
- Each machine directory contains a `config.zsh` file with machine-specific paths and settings
- The `.zshrc` has a `MACHINE` variable (set near the top) that specifies which machine config to load
- Users must manually set `MACHINE="macbook"` or `MACHINE="xps13"` in `.zshrc` for each new system
- The `install.sh` script prompts the user to select their machine type and sets this variable
- Each machine config MUST define `CLIPBOARD_COPY` variable (e.g., "pbcopy" for macOS, "xclip -selection clipboard" for Linux)

### Custom Git Functions

The repository includes several custom git workflow functions in `zsh/functions.zsh`:

- **update-main** (alias: `gum`) - Updates main/master branch, handles staying on current branch or switching if on main/master
- **backup-branch** - Creates versioned backup branches with timestamp in format `backup/{branch}/{version}-{timestamp}`
- **reset-branch-to-origin** - Resets current branch by creating trash-branch and checking out fresh from origin
- **rebase-on** - Interactive rebase on main/master or specified branch

### Custom ZSH Widgets

Key custom keybindings defined in `zsh/widgets.zsh`:

- **Ctrl+W** - Print current directory path and copy to clipboard (uses `$CLIPBOARD_COPY` variable)
- **Ctrl+F** - Toggle prepending `sudo` to the current command
- **Ctrl+Backspace** - Delete last word (backward-kill-word)
- **Ctrl+D / Ctrl+Del** - Delete next word (kill-word)
- **Ctrl+R / Ctrl+S** - History incremental pattern search (backward/forward)

**Note:** Several of these keybindings override default ZSH behavior. See README.md for a detailed conflict table and instructions on how to disable specific bindings.

## Installation

Run the unified installation script:

```bash
./install.sh
```

The script will:
1. Back up existing `.zshrc` and `.vimrc` files with timestamps
2. Create symlinks to the repository configurations
3. Prompt you to select your machine type (macbook, xps13, or skip)
4. Set the `MACHINE` variable in `.zshrc` to the selected machine type
5. Display installation instructions for dependencies

### Manual Machine Config Setup

If you skipped machine selection during installation, edit the `MACHINE` variable in `zsh/.zshrc`:

```bash
# For macOS
MACHINE="macbook"

# For Linux (XPS13)
MACHINE="xps13"
```

## Dependencies

### Required for ZSH

- **oh-my-zsh** - Shell framework
- **zsh-completions** plugin - Enhanced completions
- **fzf** - Fuzzy finder (installed via homebrew on macOS)
- **the_silver_searcher** (ag) - Fast file search for fzf
- **xclip** - Clipboard support (Linux only; macOS uses built-in pbcopy)

### Optional Development Tools

Install based on your needs:
- **pyenv** - Python version management
- **poetry** - Python dependency management
- **sdkman** - Java/JVM tool management (macOS)
- **fnm** - Node version management
- **aws-cli** - AWS command line tools

See README.md for detailed installation instructions with links for all dependencies.

## Key Configuration Details

### Shell History Configuration

Shell history is configured with extensive options for improved history management (as of PR #2):

- 10 million line history (HISTSIZE and SAVEHIST)
- History file: `~/.zsh_history`
- Timestamp format: `yyyy-mm-dd`
- Ignores simple commands: clear, ls, pwd, exit
- Shares history across all sessions
- Prevents duplicate entries
- Uses extended history format with timestamps and elapsed time

### FZF Configuration

- Base path: `/opt/homebrew/opt/fzf`
- Default command uses `ag` with hidden files: `ag --hidden -g ""`

### PATH Modifications

Machine-specific PATH modifications are now handled in the respective `<machine>/config.zsh` files (e.g., `macbook/config.zsh`, `xps13/config.zsh`). When adding new tools or paths, add them to the appropriate machine config file.

## Important Notes

- The repository path is hardcoded as `$HOME/projects/dev-environment` in `zsh/.zshrc`
- Widget implementations use the `$CLIPBOARD_COPY` variable for cross-platform clipboard support
- Each machine config must define `CLIPBOARD_COPY` ("pbcopy" for macOS, "xclip -selection clipboard" for Linux)
- The ZSH theme is set to "oldgallois" in `zsh/zsh_settings.zsh`
- The git functions assume main/master as primary branch names
- Machine-specific configs are loaded based on the `MACHINE` variable in `.zshrc` (set to "macbook", "xps13", etc.)
