if ! zgen saved; then
  echo "Creating a zgen save".

  # Load promptline.
  if [[ -e $HOME/.promptline.zsh ]]; then
    zgen load $HOME/.promptline.zsh
  fi

  # Load Oh My Zsh.
  zgen load rxrc/zshrc oh-my-zsh
  zgen oh-my-zsh

  # Oh-My-Zsh plugins to load.
  oh_my_zsh_plugins=(
    cp extract rsync
    tmux tmuxinator
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
    vim-interaction
    vi-mode
  )

  # Only load some plugins on Arch Linux.
  if [[ -f /etc/arch-release ]]; then
    oh_my_zsh_plugins+=( archlinux systemd )
  fi

  # Load Oh My Zsh plugins.
  for plugin in $oh_my_zsh_plugins; do
    zgen oh-my-zsh plugins/$plugin
  done

  # Load custom forks of some Oh My Zsh plugins.
  zgen load rxfork/oh-my-zsh plugins/systemd systemd
  zgen load rxfork/oh-my-zsh plugins/pyenv pyenv

  # Load this plugin.
  zgen load rxrc/zshrc plugin

  # The history-substring-search plugin must be loaded
  # after the zsh-syntax-highlighting plugin.
  # These plugins must be loaded last.
  zgen load zsh-users/zsh-syntax-highlighting
  zgen oh-my-zsh plugins/history-substring-search

  # Load fzf zsh plugin.
  if [[ -e /usr/share/fzf/fzf.zsh ]]; then
    zgen load /usr/share/fzf/fzf.zsh
  fi

  zgen save
fi
