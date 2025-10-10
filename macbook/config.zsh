# Clipboard copy command for macOS
export CLIPBOARD_COPY="pbcopy"

# sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"

# aws cli (homebrew installation)
export PATH="/opt/homebrew/bin/aws_completer:$PATH"
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/opt/homebrew/bin/aws_completer' aws

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# poetry
export PATH="$HOME/.local/bin:$PATH"

# node universe: nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
