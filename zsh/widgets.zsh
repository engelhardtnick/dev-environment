function _print-pwd {
  echo $PWD && echo $PWD | xclip -sel clip
  zle reset-prompt
}
zle -N _print-pwd
bindkey "^W" _print-pwd


bindkey "^H" backward-kill-word
