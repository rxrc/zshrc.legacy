if ! zgen saved; then
  echo "Creating a zgen save".

  if [[ -e /etc/profile.d/fzf.zsh ]]; then
    zgen load /etc/profile.d/fzf.zsh
  fi

  if [[ -e $HOME/.promptline.zsh ]]; then
    zgen load $HOME/.promptline.zsh
  fi

  zgen load rxrc/zshrc plugin
  zgen oh-my-zsh

  OH_MY_ZSH_PLUGINS=(${(ps: :)${OH_MY_ZSH_PLUGINS}})
  for plugin in $OH_MY_ZSH_PLUGINS; do
    zgen oh-my-zsh plugins/$plugin
  done

  zgen load rxfork/oh-my-zsh plugins/systemd systemd
  zgen load rxfork/oh-my-zsh plugins/pyenv pyenv

  zgen load zsh-users/zsh-syntax-highlighting
  zgen oh-my-zsh plugins/history-substring-search

  zgen save
fi
