# Clone GitHub repository.
function ghcl () {
  if ! [[ -n "$1" ]]; then
    echo 'Must specify repo.'
    return 1
  fi

  git clone git@github.com:$1.git
}

# Run sed in-place on all tracked files.
function gitsed () {
  if ! [[ -n "$1" ]]; then
    echo 'Must specify sed command.'
    return 1
  fi

  git ls-files -z | xargs -0 sed -i $1
}
