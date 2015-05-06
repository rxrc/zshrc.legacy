if ! zgen saved; then
  echo "Creating a zgen save".

  zgen load razor-x/zshrc plugin/exports.zsh
  zgen load razor-x/zshrc plugin
  zgen oh-my-zsh

  OH_MY_ZSH_PLUGINS=(${(ps: :)${OH_MY_ZSH_PLUGINS}})
  for plugin in $OH_MY_ZSH_PLUGINS; do
    zgen oh-my-zsh plugins/$plugin
  done

  zgen load razor-x/oh-my-zsh plugins/systemd systemd

  zgen save
fi
