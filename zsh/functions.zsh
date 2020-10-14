function reset-branch-to-origin() {
  current_branch=$(git symbolic-ref --short HEAD) && gco master && git current_branch -D $current_branch && gco $current_branch
}