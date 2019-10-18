# print pwd and copy to clipboard on ctrl+w
function _print-pwd {
  echo $PWD
  echo -n $PWD | xclip -sel clip
  zle reset-prompt
}
zle -N _print-pwd
bindkey "^W" _print-pwd

# add 'sudo ' at the beginning of the line
function _prepend-sudo() {
  if [[ "$BUFFER" != su(do|)\ * ]]; then
    BUFFER="sudo $BUFFER"
    (( CURSOR += 5 ))
  fi
}
zle -N _prepend-sudo
bindkey "^F" _prepend-sudo

# kill last word on ctrl+backspace
bindkey "^H" backward-kill-word

# kill next word on ctrl+D
bindkey "^D" kill-word
