ZSH_THEME="oldgallois"

# use hyphen-insensitive completion.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Improve shell history as advised here https://martinheinz.dev/blog/110
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
HIST_STAMPS="yyyy-mm-dd"
# Install fzf and the silver searcher:
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf
# https://github.com/junegunn/fzf?tab=readme-ov-file#using-homebrew
# https://formulae.brew.sh/formula/the_silver_searcher
export FZF_BASE=/opt/homebrew/opt/fzf
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'

HISTORY_IGNORE="(clear|ls|pwd|exit)*"

setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.


plugins=(git zsh-completions fzf)
