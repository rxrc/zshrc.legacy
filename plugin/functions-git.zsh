# Clone GitHub repository.
function ghcl () {
  git clone git@github.com:$1.git
}

# Run sed in-place on all tracked files.
function gitsed () {
  git ls-files -z | xargs -0 sed -i $1
}
