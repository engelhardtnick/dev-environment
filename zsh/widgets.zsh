# print pwd and copy to clipboard on ctrl+w
function _print-pwd {
  echo $PWD
  echo -n $PWD | pbcopy
  zle reset-prompt
}
zle -N _print-pwd
bindkey "^W" _print-pwd

# add 'sudo ' at the beginning of the line
function _prepend-sudo() {
  if [[ "$BUFFER" != "sudo "* ]]; then
    BUFFER="sudo $BUFFER"
    (( CURSOR += 5 ))
  else
    BUFFER="${BUFFER:5}"
  fi
}
zle -N _prepend-sudo
bindkey '^F' _prepend-sudo

# kill last word on ctrl+backspace
bindkey "^?" backward-kill-word

# kill next word on ctrl+D or ctrl+del
bindkey '^D' kill-word
bindkey '^[[3~' kill-word

# use back- and forward search with pattern matching
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward
