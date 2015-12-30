if ! zgen saved; then
  echo "Creating a zgen save".

  if [[ -e /etc/profile.d/fzf.zsh ]]; then
    zgen load /etc/profile.d/fzf.zsh
  fi

  zgen load rxrc/zshrc plugin
  zgen oh-my-zsh

  OH_MY_ZSH_PLUGINS=(${(ps: :)${OH_MY_ZSH_PLUGINS}})
  for plugin in $OH_MY_ZSH_PLUGINS; do
    zgen oh-my-zsh plugins/$plugin
  done

  zgen load rxfork/oh-my-zsh plugins/systemd systemd
  zgen load rxfork/oh-my-zsh plugins/pyenv pyenv

  zgen save
fi
