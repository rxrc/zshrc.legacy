#
# Oh My Zsh Configuration
#

# Disable auto update.
DISABLE_AUTO_UPDATE='true'

# Additional gems to be wrapped by bundler plugin.
BUNDLED_COMMANDS=(
  rubocop
  curate
)

# Start tmux on ssh login.
if ! [[ -z "$SSH_CONNECTION" && -z "$REMOTEHOST" ]]; then
  ZSH_TMUX_AUTOSTART=true
fi
