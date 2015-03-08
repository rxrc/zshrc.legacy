bindkey "^F" forward-word
bindkey "^R" backward-word

# Fix history-substring-search.
# https://github.com/robbyrussell/oh-my-zsh/issues/1433#issuecomment-38358007
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
