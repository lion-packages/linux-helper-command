# Function gclone
# This function clones a Git repository into a specified new directory and then changes to that directory.
function gclone {
  # Check if exactly two arguments are provided
  if [ "$#" -ne 2 ]; then
    echo "Usage: gclone <repository> <project-name>"
    return 1
  fi

  # Assign the arguments to variables for readability
  repo=$1
  project_name=$2

  # Clone the repository into the project name directory
  git clone $repo $project_name || return 1

  # Change to the project directory
  cd $project_name || return 1
}

# Function into_docker
# This function connects interactively to a specific Docker container using the 'lion' user.
function into_docker {
  # $1 represents the first argument passed to the function
  # If no argument is provided, default to bash, otherwise use zsh
  local shell=${2:-zsh}

  docker exec -it -u lion $1-app $shell
}


# Function new_commit
# This function creates a new Git commit with a specified type and message.
function new_commit {
  # Assign the arguments to variables for readability
  type=$1
  message=$2

  # Create a new Git commit with the specified type and message
  git commit -m "$type: $message"
}

# Alias for building and starting Docker containers in the background
alias build-d="docker compose up -d --build"
# Usage: build
# Builds and starts the Docker containers defined in docker-compose.yml in detached mode.
# Rebuilds the images before starting the containers.

# Alias for connecting to a specific Docker container as 'lion'
alias into="into_docker $1"
# Usage: into <service>
# Calls the into_docker function with the specified service name.

# Alias for starting Docker containers in the background
alias up="docker compose up -d"
# Usage: up
# Builds and starts the Docker containers defined in docker-compose.yml in detached mode.

# Alias for stopping Docker containers
alias down="docker compose down"
# Usage: down
# Stops and removes the Docker containers defined in docker-compose.yml.

# Alias for stopping Docker containers and removing volumes
alias down-v="docker compose down -v"
# Usage: down-v
# Stops and removes the Docker containers defined in docker-compose.yml, and also removes the associated volumes.

# Alias for restarting Docker containers
alias restart="docker compose restart"
# Usage: restart
# Restarts all Docker containers defined in docker-compose.yml.

# Alias for displaying the Git status
alias status="git status"
# Usage: status
# Shows the working tree status, including staged, unstaged, and untracked files.

# Alias for displaying the Git commit log
alias log="git log"
# Usage: log
# Shows the commit logs, including commit hashes, authors, dates, and messages.

# Alias for adding files to the Git staging area
alias add="git add $1"
# Usage: add <file>
# Adds the specified file(s) to the Git staging area.

# Alias for amending the last Git commit
alias amend="git commit --amend"
# Usage: amend
# Amends the last Git commit, allowing you to modify the commit message and include additional changes.

# Alias for fetching and pulling the latest changes from the main branch
alias fetch="git checkout main && git fetch origin && git pull origin main"
# Usage: fetch
# Checks out the main branch, fetches updates from the remote repository, and pulls the latest changes.

# Alias for listing Git branches
alias branch="git branch"
# Usage: branch
# Lists all local Git branches.

# Alias for deleting a Git branch
alias branch-d="git branch -D $1"
# Usage: branch-d <branch-name>
# Deletes the specified Git branch.

# Alias for creating a new Git branch and checking it out
alias branch-b="git checkout -b $1"
# Usage: branch-b <branch-name>
# Creates and checks out a new Git branch with the specified name.

# Alias for checking out an existing Git branch
alias branch-r="git checkout $1"
# Usage: branch-r <branch-name>
# Checks out the specified Git branch.

# Alias for renaming the current Git branch
alias branch-m="git branch -M $1"
# Usage: branch-m <new-branch-name>
# Renames the current branch to the specified new name.

# Alias for pulling the latest changes from a specified branch
alias pull="git pull origin $1"
# Usage: pull <branch-name>
# Pulls the latest changes from the specified branch on the remote repository.

# Alias for pushing changes to a specified branch
alias push="git push origin $1"
# Usage: push <branch-name>
# Pushes local changes to the specified branch on the remote repository.

# Alias for deleting a remote branch
alias push-d="git push origin $1 -d"
# Usage: push-d <branch-name>
# Deletes the specified branch from the remote repository.

# Alias for force pushing changes to a specified branch
alias push-f="git push origin $1 -f"
# Usage: push-f <branch-name>
# Force pushes local changes to the specified branch on the remote repository.

# Alias for committing changes with a specified message
alias commit="git commit -m $1"
# Usage: commit <message>
# Commits staged changes with the specified commit message.

# Aliases for creating commits with a specific type and message
alias feat="new_commit feat $1"
# Usage: feat <message>
# Commits changes with the type 'feat' and the specified message.

alias fix="new_commit fix $1"
# Usage: fix <message>
# Commits changes with the type 'fix' and the specified message.

alias build="new_commit build $1"
# Usage: build <message>
# Commits changes with the type 'build' and the specified message.

alias ci="new_commit ci $1"
# Usage: ci <message>
# Commits changes with the type 'ci' and the specified message.

alias chore="new_commit chore $1"
# Usage: chore <message>
# Commits changes with the type 'chore' and the specified message.

alias style="new_commit style $1"
# Usage: style <message>
# Commits changes with the type 'style' and the specified message.

alias docs="new_commit docs $1"
# Usage: docs <message>
# Commits changes with the type 'docs' and the specified message.

alias perf="new_commit perf $1"
# Usage: perf <message>
# Commits changes with the type 'perf' and the specified message.

alias refactor="new_commit refactor $1"
# Usage: refactor <message>
# Commits changes with the type 'refactor' and the specified message.

alias tests="new_commit test $1"
# Usage: tests <message>
# Commits changes with the type 'test' and the specified message.

alias rb="git rebase $1"
# Usage: rb <branch>
# Starts a rebase on the specified branch.

alias rb-c="git rebase --continue"
# Usage: rb-c
# Continues the rebase process after resolving conflicts.

alias rb-a="git rebase --abort"
# Usage: rb-a
# Aborts the ongoing rebase process and returns to the original branch state.

alias st="git stash"
# Usage: st
# Stashes uncommitted changes to save them temporarily.

alias st-d="git stash drop"
# Usage: st-d <stash@{n}>
# Deletes a specific stash entry from the stash list.

alias st-a="git stash apply"
# Usage: st-a <stash@{n}>
# Applies a specific stash entry to the working directory.

alias cherry="git cherry-pick $1"
# Usage: cherry <commit-hash>
# Applies the changes from the specified commit to the current branch.

alias switch="git switch -c $1"
# Usage: switch <branch-name>
# Creates a new branch with the specified name and switches to it.
