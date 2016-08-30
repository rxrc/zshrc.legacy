# Create cache directory.
mkdir -p $XDG_CACHE_HOME/zsh

# Set history file.
HISTFILE=$XDG_CACHE_HOME/zsh/history

# Load Base16 color scheme.
source $BASE16_SHELL/base16-$BASE16_THEME-$BASE16_TYPE.sh
