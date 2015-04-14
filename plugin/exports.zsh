export EDITOR='vim'

# Add Android tools to path.
if [[ -d /opt/android-sdk/tools ]]; then
  PATH=$PATH:/opt/android-sdk/tools
fi

# Add Android platform tools to path.
if [[ -d /opt/android-sdk/platform-tools ]]; then
  PATH=$PATH:/opt/android-sdk/platform-tools
fi
