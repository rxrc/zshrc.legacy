# Clone GitHub repository.
function ghcl () {
  if ! [[ -n "$1" ]]; then
    echo 'Must specify repo.'
    return 1
  fi

  git clone git@github.com:$1.git $2
}

# Run sed in-place on all tracked files.
function gitsed () {
  if ! [[ -n "$1" ]]; then
    echo 'Must specify sed command.'
    return 1
  fi

  git ls-files -z | xargs -0 sed -i $1
}

# Create a new project from https://github.com/makenew.
function mknew () {
  if ! [[ -n "$1" ]]; then
    echo 'Must specify repo.'
    return 1
  fi

  if ! [[ -n "$2" ]]; then
    echo 'Must specify name.'
    return 1
  fi

  git clone git@github.com:makenew/$1.git $2
  cd $2
  git remote rename origin upstream
  git remote set-url upstream https://github.com/makenew/$1.git
  git fetch --no-tags upstream
}
