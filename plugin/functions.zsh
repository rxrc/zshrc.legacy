# Update Arch Linux mirrorlist.
function mirrorupg () {
  sudo reflector --verbose -l 5 -c US -p https \
    --sort rate --save /etc/pacman.d/mirrorlist
}

# Start a local http server.
function pyserver () {
  python -m http.server $1
}

# Generate an SSL certificate for test use only.
function sslgen-cert-test () {
  if ! [[ -n "$1" ]]; then
    echo 'Must specify name to use.'
    return 1
  fi

  openssl req -new -x509 -nodes -newkey rsa:2048 -keyout $1.key -out $1.pem -days 36524 \
    -subj "/C=US/ST=California/L=San Francisco/O=Example Inc./CN=$1/emailAddress=webmaster@example.com"
}

# Create a new tar archive.
function tarz () {
  if ! [[ -n "$1" ]]; then
    echo 'Must specify directory to use.'
    return 1
  fi

  tar -czf $1.tar.gz $1
}

# Upgrade tmuxrc.
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

# Upgrade vimrc.
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

# Upgrade zshrc.
function zshupg () {
  if ! [[ -d ~/.zgen.zsh ]]; then
    echo 'zgen is not installed.'
    exit 1
  fi

  zgen selfupdate
  zgen update
}
