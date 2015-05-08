function ghcl () {
  git clone git@github.com:$1.git
}

function gitsed () {
  git ls-files -z | xargs -0 sed -i $1
}

function mirrorupg () {
  sudo reflector --verbose -l 5 -c US -p https \
    --sort rate --save /etc/pacman.d/mirrorlist
}

function pyserver () {
  python -m http.server $1
}

function sslgen-cert-test () {
  openssl req -new -x509 -nodes -newkey rsa:2048 -keyout $1.key -out $1.pem -days 36524 \
    -subj "/C=US/ST=California/L=San Francisco/O=Example Inc./CN=$1/emailAddress=webmaster@example.com"
}

function tarz () {
  tar -czf $1.tar.gz $1
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
  if ! [[ -d ~/.vim/bundle/neobundle.vim ]]; then
    echo 'NeoBundle is not installed.'
    return 1
  fi

  vimrc=$HOME/.vimrc

  vim -N -u $vimrc -c \
    "try | NeoBundleUpdate $* | finally | qall! | endtry" \
    -U NONE -i NONE -V1 -e -s

  vim -N -u $vimrc -c \
    "try | NeoBundleInstall $* | finally | qall! | endtry" \
    -U NONE -i NONE -V1 -e -s

  vim -N -u $vimrc -c \
    "try | NeoBundleClean! $* | finally | qall! | endtry" \
    -U NONE -i NONE -V1 -e -s
}

function zshupg () {
  if ! [[ -d ~/.zgen.zsh ]]; then
    echo 'zgen is not installed.'
    exit 1
  fi

  zgen selfupdate
  zgen update
}
