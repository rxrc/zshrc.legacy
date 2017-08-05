# Find: [f]ile by name.
function ff () {
  if ! [[ -n "$1" ]]; then
    echo 'Must specify a search string.'
    return 1
  fi

  find . -name "$1"
}

# Find: name [a]ll.
function fa () { ff "*${1}*" }

# Find: name [s]tarts with.
function fs () { ff "${1}*" }

# Find name [e]nds with.
function fe () { ff "*${1}" }

# Update Arch Linux mirrorlist.
function mirrorupg () {
  sudo reflector \
    --verbose -l 5 -c US -p https \
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

function mx () {
  if ! [[ -x $(command -v tmuxinator ) ]]; then
    echo 'tmuxinator is not installed.'
    exit 1
  fi

  if ! [[ -n "$1" ]]; then
    tmuxinator start default
  else
    tmux attach -t $1 || tmux new-session -s $1
  fi
}

# Open neovim-qt and hide output.
function nv () {
  if ! [[ -x $(command -v nvim-qt ) ]]; then
    echo 'neovim-qt is not installed.'
    exit 1
  fi

  NVIM_TUI_ENABLE_TRUE_COLOR=1 nohup nvim-qt $1 &>/dev/null &
}

# Upgrade tmuxrc.
function tmuxupg () {
  if ! [[ -d $HOME/.tmux/plugins/tpm ]]; then
    echo 'tpm is not installed.'
    return 1
  fi

  if ! [[ -n "$TMUX" ]]; then
    echo 'Run in a tmux session up update.'
    return 2
  fi

  $HOME/.tmux/plugins/tpm/bin/update_plugins all && \
  $HOME/.tmux/plugins/tpm/bin/install_plugins    && \
  $HOME/.tmux/plugins/tpm/bin/update_plugins all
}

# Open Viewnior and hide output.
function vn () {
  if ! [[ -x $(command -v viewnior ) ]]; then
    echo 'Viewnior is not installed.'
    exit 1
  fi

  nohup viewnior $1 &>/dev/null &
}

# Open Zathura and hide output.
function zt () {
  if ! [[ -x $(command -v zathura ) ]]; then
    echo 'Zathura is not installed.'
    exit 1
  fi

  nohup zathura $1 &>/dev/null &
}

# Upgrade nvimrc.
function nvimupg () {
  if ! [[ -e $XDG_CONFIG_HOME/nvim/autoload/plug.vim ]]; then
    echo 'vim-plug is not installed.'
    return 1
  fi

  nvim -c PlugUpgrade -c qall
  nvim -c PlugUpdate -c qall
  nvim -c PlugInstall -c qall
  nvim -c PlugClean! -c qall
}

# Upgrade vimrc.
function vimupg () {
  if ! [[ -e $HOME/.vim/autoload/plug.vim ]]; then
    echo 'vim-plug is not installed.'
    return 1
  fi

  vim -c PlugUpgrade -c qall
  vim -c PlugUpdate -c qall
  vim -c PlugInstall -c qall
  vim -c PlugClean! -c qall
}

# Upgrade zshrc.
function zshupg () {
  if ! [[ -d $HOME/.zgen.zsh ]]; then
    echo 'zgen is not installed.'
    exit 1
  fi

  zgen selfupdate
  zgen update
}
