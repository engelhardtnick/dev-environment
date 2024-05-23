function reset-branch-to-origin() {
  current_branch=$(git symbolic-ref --short HEAD);
  git checkout trash-branch || git checkout -b trash-branch && git branch -D "$current_branch";
  git checkout "$current_branch"
}

function update-main() {
  # Get the current branch name
  current_branch=$(git symbolic-ref --short HEAD);

  # Define the main branch names
  main_branch_names=("main" "master")

  # Check if we are already on main or master
  if [[ "${main_branch_names[*]}" =~ "${current_branch}" ]]; then
    echo "Currently on $current_branch. Pulling latest changes..."
    git pull || { echo "Failed to pull changes from $current_branch"; return 1; }
  else
    # Try to checkout main or master, whichever exists
    for branch in "${main_branch_names[@]}"; do
      if git show-ref --verify --quiet refs/heads/"$branch"; then
        echo "Switching to $branch to pull latest changes..."
        git checkout "$branch" || { echo "Failed to checkout $branch"; return 1; }
        git pull || { echo "Failed to pull changes from $branch"; return 1; }
        echo "Switching back to $current_branch..."
        git checkout "$current_branch" || { echo "Failed to checkout $current_branch"; return 1; }
        return 0
      fi
    done
    echo "Neither main nor master branch exists in the repository."
    return 1
  fi
}

function backup-branch() {
  # Get the current branch name
  current_branch=$(git symbolic-ref --short HEAD);

  # Get the current date and time in UTC
  current_date_time=$(date -u +"%Y%m%d%H%M%S")

  # Get the list of existing backup branches for the current branch
  existing_backups=$(git branch --list "backup/$current_branch/*")

  # Find the highest version number among the existing backups
  highest_version=0
  for backup in $existing_backups; do
    version=${backup##*/}
    version=${version%%-*}
    if (( version > highest_version )); then
      highest_version=$version
    fi
  done

  # Define the backup branch name with the incremented version number and current date time
  backup_branch="backup/$current_branch/$((highest_version + 1))-$current_date_time"

  echo "Creating backup of $current_branch as $backup_branch..."
  git checkout -b "$backup_branch" || { echo "Failed to create backup branch $backup_branch"; return 1; }
  echo "Switching back to $current_branch..."
  git checkout "$current_branch" || { echo "Failed to checkout $current_branch"; return 1; }
  echo "Backup of $current_branch created as $backup_branch."
  return 0
}

function rebase-on() {
  # Define the default branch names
  default_branch_names=("main" "master")

  # If an argument is provided, use it as the branch to rebase on
  # Otherwise, use the default branch names
  branch_names=("${1:-${default_branch_names[@]}}")

  # Try to rebase on the provided branch or main or master, whichever exists
  for branch in "${branch_names[@]}"; do
    if git show-ref --verify --quiet refs/heads/"$branch"; then
      echo "Running interactive rebase on $branch..."
      git rebase --interactive "$branch" || { echo "Failed to rebase on $branch"; return 1; }
      return 0
    fi
  done
  echo "None of the specified branches exist in the repository."
  return 1
}