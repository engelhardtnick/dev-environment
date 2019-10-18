# print pwd and copy to clipboard on ctrl+w
function _print-pwd {
  echo $PWD && echo $PWD | xclip -sel clip
  zle reset-prompt
}
zle -N _print-pwd
bindkey "^W" _print-pwd

# kill last word on ctrl+backspace
bindkey "^H" backward-kill-word
