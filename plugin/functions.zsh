function mirrorupg () {
  sudo reflector -l 5 -c US \
    --sort rate --save /etc/pacman.d/mirrorlist
}

function pyserver () {
  python -m http.server $1
}

function tmuxupg () {
  if ! [[ -d ~/.tmux/plugins/tpm ]]; then
    echo 'tpm is not installed.'
    return 1
  fi

  if ! [[ -n "$TMUX" ]]; then
    echo 'Run in a tmux session up update.'
    return 2
  fi

  ~/.tmux/plugins/tpm/scripts/update_plugin.sh all && \
  ~/.tmux/plugins/tpm/scripts/install_plugins.sh   && \
  ~/.tmux/plugins/tpm/scripts/update_plugin.sh all
}

function vimupg () {
  if ! [[ -d ~/.vim/bundle/Vundle.vim ]]; then
    echo 'Vundle is not installed.'
    return 1
  fi

  vim -c NeoBundleUpdate -c quitall  && \
  vim -c NeoBundleInstall -c quitall && \
  vim -c NeoBundleClean! -c quitall
}

function zshupg () {
  if ! [[ -d ~/.zgen.zsh ]]; then
    echo 'zgen is not installed.'
    exit 1
  fi

  zgen selfupdate
  zgen update
}
