export ZSH="$HOME/.oh-my-zsh"

# path to custom-environment repo
export CUSTOM_ZSH="$HOME/projects/dev-environment"

# Machine name - set this to match your machine config directory (e.g., "macbook", "xps13")
# Available configs: macbook, xps13
MACHINE="macbook"

# zsh-completions, should be done before sourcing oh-my-zsh.sh
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit

source $CUSTOM_ZSH/zsh/zsh_settings.zsh
source $CUSTOM_ZSH/zsh/widgets.zsh
source $ZSH/oh-my-zsh.sh
source $CUSTOM_ZSH/zsh/aliases.zsh
source $CUSTOM_ZSH/zsh/functions.zsh

# Load machine-specific configuration based on MACHINE variable
if [[ -n "$MACHINE" ]] && [[ -f "$CUSTOM_ZSH/$MACHINE/config.zsh" ]]; then
  source "$CUSTOM_ZSH/$MACHINE/config.zsh"
else
  echo "Error: Machine config not found at $CUSTOM_ZSH/$MACHINE/config.zsh"
  echo "Please set MACHINE variable in .zshrc to one of: macbook, xps13"
fi
