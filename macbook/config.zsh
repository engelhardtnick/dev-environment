# Clipboard copy command for macOS
export CLIPBOARD_COPY="pbcopy"

# Homebrew environment setup
# These values are from running `brew shellenv` - run that command on a different machine to find the correct paths
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

# sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"

# aws cli (homebrew installation)
# Uncomment these lines if you want to enable AWS CLI:
# export PATH="/opt/homebrew/bin/aws_completer:$PATH"
# autoload bashcompinit && bashcompinit
# autoload -Uz compinit && compinit
# complete -C '/opt/homebrew/bin/aws_completer' aws

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# poetry
export PATH="$HOME/.local/bin:$PATH"

# node universe: nvm
# Uncomment these lines if you want to enable NVM:
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
