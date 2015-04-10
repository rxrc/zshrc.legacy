# Set and create cache directory.
if [[ -z "$XDG_CACHE_HOME" ]]; then
  XDG_CACHE_HOME=$HOME/.cache
fi

mkdir -p $XDG_CACHE_HOME/zsh
