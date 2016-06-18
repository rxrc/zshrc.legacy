# Always use vim.
[[ -x $(command -v nvim) ]] && alias vi='nvim'

# Additional vim aliases.
[[ -x $(command -v nvim-qt) ]] && alias vv='nv'

# ack is ack-grep on some systems.
[[ -x $(command -v ack-grep) ]] && alias ack='ack-grep'

# Copy to clipboard with xclip.
[[ -x $(command -v xclip ) ]] && alias cb='xclip -selection clipboard'

# Fixes a bug with rake and square brackets.
alias rake='noglob bundle exec rake'

# Make use of aura over pacman and add helpful aura aliases.
if [[ -x $(command -v aura) ]]; then
  alias pacman='aura'
  alias aura='sudo aura'
  alias aurin='aura -A'
  alias aurupg='aura -Au'
fi

# npm aliases.
if [[ -x $(command -v npm) ]]; then
  alias npmi='npm install --save'
  alias npmid='npm install --save-dev'
  alias npmu='npm uninstall --save'
  alias npmud='npm uninstall --save-dev'
  alias npmsw='npm shrinkwrap'
  alias npmswd='npm shrinkwrap -dev'
  alias npmrm='rm -rf node_modules'
fi
