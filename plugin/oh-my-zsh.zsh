# Oh-My-Zsh plugins to load.
plugins=(
  history-substring-search
  cp extract rsync
  tmux tmuxinator
  git github
  rbenv ruby gem rails rake bundler
  knife vagrant
  heroku
  bower
  pip
)

if [[ -x `which -p pacman` ]]; then
  plugins+=( archlinux systemd )
fi

if [[ -x `which -p virtualenvwrapper` ]]; then
  plugins+=( virtualenvwrapper )
fi

export OH_MY_ZSH_PLUGINS="$plugins"

# Additional gems to be wrapped by bundler plugin.
BUNDLED_COMMANDS=(
  rubocop
  curate
)

# Start tmux on ssh login.
if ! [[ -z "$SSH_CONNECTION" ]]; then
  ZSH_TMUX_AUTOSTART=true
fi
