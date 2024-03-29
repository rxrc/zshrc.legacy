install_zshrc () {

set -e
set -u

echo -e "\033[32m➤ Installing!   \033[0m"

command -v git >/dev/null 2>&1 \
  && echo -e "\033[32m  ✔ Found         ❰ Git ❱   \033[0m" \
  || {
    echo -e "\033[31m  ✘ Missing       ❰ Git ❱   \033[0m"
    echo -e "\033[31m✘ Install failed!"
    exit 1
  }

if [ -d $HOME/.zgen.zsh ]; then
  echo -e "\033[32m  ✔ Found         ❰ zgen ❱   \033[0m"
else
  echo -e "  ➤ Installing    ❰ zgen ❱   \033[0m"

  command -v git >/dev/null 2>&1 && \
    env git clone https://github.com/tarjoilija/zgen.git $HOME/.zgen.zsh >/dev/null 2>&1

  echo -e "\033[32m    ✔ Installed   ❰ zgen ❱   \033[0m"
fi

if [ -f $HOME/.zshrc ] || [ -h $HOME/.zshrc ]; then
  ZSHRC_LINE=$(head -n 1 $HOME/.zshrc);
  if [ "$ZSHRC_LINE" != '# rxrc/zshrc' ]; then
    echo -e "  ➤  Exists       ❰ ~/.zshrc ❱   \033[0m"

    mv $HOME/.zshrc $HOME/.zshrc.preinstall

    echo -e "\033[32m    ✔ Moved to    ❰ ~/.zshrc.preinstall ❱   \033[0m"
  else
    rm $HOME/.zshrc
  fi
fi

echo -e "  ➤ Installing    ❰ ~/.zshrc ❱   \033[0m"

tee $HOME/.zshrc >/dev/null <<EOF
# rxrc/zshrc

branch="\${ZSHRC_BRANCH:-master}"

source "\${HOME}/.zgen.zsh/zgen.zsh"

if [[ -d "\${HOME}/.zgen/local/zshrc-\${branch}" ]]; then
  source "\${HOME}/.zgen/local/zshrc-\${branch}/plugins.zsh"
elif [[ -d "\${HOME}/.zgen/rxrc/zshrc-\${branch}" ]]; then
  source "\${HOME}/.zgen/rxrc/zshrc-\${branch}/plugins.zsh"
else
  zgen load rxrc/zshrc plugin \$branch
  zgen update
  echo
  echo '  ✔ Installed zshrc as zgen plugin!'
  echo
  echo '  ➤ Press any key to exit this shell.'
  echo '  ➤ Open a new shell to finish setup.'
  read -s -n 1
  exit 0
fi
EOF

echo -e "\033[32m    ✔ Installed   ❰ ~/.zshrc ❱   \033[0m"

echo -e "\033[32m✔ Install complete!   \033[0m"

exit 0
}

install_zshrc
