# Set editor.
export EDITOR='vim'

# Set Base16 Shell path.
if [[ -z $BASE16_SHELL ]]; then
  export BASE16_SHELL=$HOME/.zgen/chriskempson/base16-shell-master
fi

# Set Base16 theme.
if [[ -z $BASE16_THEME ]]; then
  export BASE16_THEME=default
fi

# Set Base16 background type.
if [[ -z $BASE16_TYPE ]]; then
  export BASE16_TYPE=dark
fi

# Set Vim color scheme.
if [[ -z $VIM_COLOR ]]; then
  export VIM_COLOR=base16-$BASE16_THEME
fi

# Set Vim background.
if [[ -z $VIM_BACKGROUND ]]; then
  export VIM_BACKGROUND=$BASE16_TYPE
fi

# XDG Base Directory Specification.
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CACHE_HOME=$HOME/.cache

# Set fzf default command.
if [[ -x $(command -v fzf) && \
      -x $(command -v ag) ]]; then
  export FZF_DEFAULT_COMMAND='(ag -g "")'
fi

# Set Go path.
if [[ -d $HOME/go ]]; then
  export GOPATH="$HOME/go"
fi

# Set kitchen-sync transfer mode.
export KITCHEN_SYNC_MODE=rsync

# Set ssh-agent socket.
if [[ -S $XDG_RUNTIME_DIR/ssh-agent.socket ]]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

# Add Android tools to path.
if [[ -d /opt/android-sdk/tools ]]; then
  PATH=$PATH:/opt/android-sdk/tools
fi

# Add Android platform tools to path.
if [[ -d /opt/android-sdk/platform-tools ]]; then
  PATH=$PATH:/opt/android-sdk/platform-tools
fi

# Add local binaries to path.
if [[ -d $HOME/.local/bin ]]; then
  PATH=$HOME/.local/bin:$PATH
fi

# Add Go binaries to path.
if [[ ! -z "$GOPATH" && -d $GOPATH/bin ]]; then
  PATH=$GOPATH/bin:$PATH
fi

# Add npm installed binaries to path.
if [[ -d $HOME/.npm/bin ]]; then
  PATH=$HOME/.npm/bin:$PATH
fi

# Add meteor binary to path.
if [[ -d $HOME/.meteor ]]; then
  PATH=$HOME/.meteor:$PATH
fi

# Add Cabal installed binaries to path.
if [[ -d $HOME/.cabal ]]; then
  PATH=$HOME/.cabal/bin:$PATH
fi
