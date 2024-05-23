export ZSH="$HOME/.oh-my-zsh"

# path to custom-environment repo
export CUSTOM_ZSH="$HOME/projects/dev-environment"

source $CUSTOM_ZSH/zsh/zsh_settings.zsh
source $CUSTOM_ZSH/zsh/widgets.zsh
source $ZSH/oh-my-zsh.sh
source $CUSTOM_ZSH/zsh/aliases.zsh
source $CUSTOM_ZSH/zsh/functions.zsh

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# poetry
export PATH="$HOME/.local/bin:$PATH"

# sdkman
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

# aws cli
export PATH="/opt/homebrew/bin/aws_completer:$PATH"
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/opt/homebrew/bin/aws_completer' aws
