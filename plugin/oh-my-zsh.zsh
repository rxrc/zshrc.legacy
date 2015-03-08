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

# Additional gems to be wrapped by bundler plugin.
bundled_commands=(
  rubocop
  curate
)

# Export variables for Oh-My-Zsh.
export OH_MY_ZSH_PLUGINS="$plugins"
export BUNDLED_COMMANDS="$bundled_commands"
