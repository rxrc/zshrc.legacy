if ! zgen saved; then
  echo "Creating a zgen save".

  zgen load rxrc/zshrc plugin

  zgen save
fi
