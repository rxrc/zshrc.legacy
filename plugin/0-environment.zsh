# Editor.
export EDITOR='vim'

# XDG Base Directory Specification.
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CACHE_HOME=$HOME/.cache

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

# Add Cabal installed binaries to path.
if [[ -d $HOME/.cabal ]]; then
  PATH=$HOME/.cabal/bin:$PATH
fi
