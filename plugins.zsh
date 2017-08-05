if ! zgen saved; then
  echo "Creating a zgen save".

  # Load environment overrides.
  if [[ -e $HOME/.environment.zsh ]]; then
    zgen load $HOME/.environment.zsh
  fi

  # Load promptline.
  if [[ -e $HOME/.promptline.sh ]]; then
    zgen load $HOME/.promptline.sh
  fi

  # Clone Base16 Shell.
  zgen clone chriskempson/base16-shell

  # Load Oh My Zsh.
  zgen load rxrc/zshrc oh-my-zsh
  zgen oh-my-zsh

  # Oh-My-Zsh plugins to load.
  oh_my_zsh_plugins=(
    docker
    docker-compose
    cp extract rsync
    git github
    nvm
    rbenv ruby gem rake bundler
    knife vagrant
    heroku
    bower
    python pip
    golang
    lein
    meteor
    httpie
    vim-interaction
    vi-mode
  )

  # Only load tmux plugins when tmux is installed.
  if [[ -x $(command -v tmux ) ]]; then
    oh_my_zsh_plugins+=( tmux tmuxinator )
  fi

  # Only load some plugins on Arch Linux.
  if [[ -f /etc/arch-release ]]; then
    oh_my_zsh_plugins+=( archlinux systemd )
  fi

  # Load Oh My Zsh plugins.
  for plugin in $oh_my_zsh_plugins; do
    zgen oh-my-zsh plugins/$plugin
  done

  if [[ -e $HOME/meltwater ]]; then
    zgen load git@github.com:meltwater/mlabsh.git team
  fi

  # Load custom forks of some Oh My Zsh plugins.
  zgen load rxfork/oh-my-zsh plugins/systemd systemd
  zgen load rxfork/oh-my-zsh plugins/pyenv pyenv

  # Load this plugin.
  zgen load rxrc/zshrc plugin

  # Load fzf zsh plugin.
  if [[ -e /usr/share/fzf/fzf.zsh ]]; then
    zgen load /usr/share/fzf/fzf.zsh
  fi

  # The history-substring-search plugin must be loaded
  # after the zsh-syntax-highlighting plugin.
  # These plugins must be loaded last.
  zgen oh-my-zsh plugins/history-substring-search
  zgen load zsh-users/zsh-syntax-highlighting

  zgen save
fi
