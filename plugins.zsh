if ! zgen saved; then
  echo "Creating a zgen save".

  zgen load razor-x/zshrc plugin

  zgen save
fi
