function reset-branch-to-origin() {
  export current_branch=$(git symbolic-ref --short HEAD);
  git checkout trash-branch || git checkout -b trash-branch && git branch -D $current_branch;
  git checkout $current_branch
}

function update-master() {
  export current_branch=$(git symbolic-ref --short HEAD);
  git checkout master && git pull;
  git checkout $current_branch
}