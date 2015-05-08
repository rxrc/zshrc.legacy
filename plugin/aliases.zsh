# Always use vim.
[[ -x $(command -v vim) ]] && alias vi='vim'

# ack is ack-grep on some systems.
[[ -x $(command -v ack-grep) ]] && alias ack='ack-grep'

# Fixes a bug with rake and square brackets.
alias rake='noglob bundle exec rake'

# Make use of aura over pacman and add helpful aura aliases.
if [[ -x $(command -v aura) ]]; then
  alias pacman='aura'
  alias aura='sudo aura'
  alias aurin='aura -A'
  alias aurupg='aura -Au'
fi
