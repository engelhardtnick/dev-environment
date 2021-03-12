function reset-branch-to-origin() {
  export current_branch=$(git symbolic-ref --short HEAD);
  git checkout trash-branch || git checkout -b trash-branch && git branch -D $current_branch;
  git checkout $current_branch
}

function update-master() {
  main_branch_names=("master" "main")
  current_branch=$(git symbolic-ref --short HEAD);
  # shellcheck disable=SC2076
  if [[ "${main_branch_names[*]}" =~ "${current_branch}" ]]; then
    git pull
  else
    git checkout master && git pull;
    git checkout $current_branch;
fi
}