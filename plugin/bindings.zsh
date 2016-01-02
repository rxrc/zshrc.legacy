# Basic word movement.
bindkey '^F' forward-word
bindkey '^R' backward-word

# Additional binds for history-substring-search.
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
