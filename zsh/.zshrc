export ZSH="$HOME/.oh-my-zsh"

# path to custom-environment repo
export CUSTOM_ZSH="$HOME/projects/dev-environment"

source $CUSTOM_ZSH/zsh/zsh_settings.zsh
source $CUSTOM_ZSH/zsh/widgets.zsh
source $ZSH/oh-my-zsh.sh
source $CUSTOM_ZSH/zsh/aliases.zsh
source $CUSTOM_ZSH/$HOST-specific/env_vars.zsh

export PATH=$PATH:/usr/sbin
