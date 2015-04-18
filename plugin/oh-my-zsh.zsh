# Oh-My-Zsh plugins to load.
plugins=(
  history-substring-search
  cp extract rsync
  tmux tmuxinator
  git github
  rbenv ruby gem rake bundler
  knife vagrant
  heroku
  bower
  pip
  vim-interaction
)

if [[ -x `which -p pacman` ]]; then
  plugins+=( archlinux systemd )
fi

if [[ -x `which -p virtualenvwrapper` ]]; then
  plugins+=( virtualenvwrapper )
fi

export OH_MY_ZSH_PLUGINS="$plugins"

# Disable auto update.
DISABLE_AUTO_UPDATE='true'

# Additional gems to be wrapped by bundler plugin.
BUNDLED_COMMANDS=(
  rubocop
  curate
)

# Start tmux on ssh login.
if ! [[ -z "$SSH_CONNECTION" && -z "$REMOTEHOST" ]]; then
  ZSH_TMUX_AUTOSTART=true
fi
