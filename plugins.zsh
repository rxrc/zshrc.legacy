if ! zgen saved; then
  echo "Creating a zgen save".

  # Load fzf zsh plugin.
  if [[ -e /etc/profile.d/fzf.zsh ]]; then
    zgen load /etc/profile.d/fzf.zsh
  fi

  # Load promptline.
  if [[ -e $HOME/.promptline.zsh ]]; then
    zgen load $HOME/.promptline.zsh
  fi

  # Load this plugin and initialize Oh My Zsh.
  zgen load rxrc/zshrc plugin
  zgen oh-my-zsh

  # The Oh My Zsh settings and the plugins to load
  # are defined in plugin/oh-my-zsh.zsh.
  OH_MY_ZSH_PLUGINS=(${(ps: :)${OH_MY_ZSH_PLUGINS}})
  for plugin in $OH_MY_ZSH_PLUGINS; do
    zgen oh-my-zsh plugins/$plugin
  done

  # Load custom forks of some Oh My Zsh plugins.
  zgen load rxfork/oh-my-zsh plugins/systemd systemd
  zgen load rxfork/oh-my-zsh plugins/pyenv pyenv

  # The history-substring-search plugin must be loaded
  # after the zsh-syntax-highlighting plugin.
  zgen load zsh-users/zsh-syntax-highlighting
  zgen oh-my-zsh plugins/history-substring-search

  zgen save
fi
