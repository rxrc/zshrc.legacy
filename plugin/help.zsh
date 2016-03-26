function zshrc () {
  echo 'Quick reference for zshrc
  [General]
  - Leading any command with a space will not record it to history.

  [Binds]
  - ^F and ^V move one word foward or backward.
  - ^A and ^E move to beginning or end of line.
  - ^N and ^P navigate command history.
  - k and j navigate command history in Vi mode.

  [Aliases]
  - aurin and aurupg are AUR versions of pacin and pacupg.
  - cb will xclip a file to the clipboard.
  - gfup is git fetch --no-tags upstream.
  - mx starts the default tmuxinator profile.

  [Functions]
  - Shortcuts to find:
    - ff finds by name
    - fa finds by *name*
    - fs finds by $name*
    - fe finds by *$name
  - tarz will create a tar archive.
  - vn will spawn Viewnior.
  - zt will spawn Zathura.
  - Shortcuts for git:
    - ghcl user/repo clones from GitHub
    - gitsed runs a sed command on all tracked files
    - mknew will setup a new makenew project
  - mirrorupg updates the Arch mirrorlist.
  - pyserver starts an Python http server.
  - sslgen-cert-test generates a dummy SSL certificate.
  - vimupg, zshupg, and tmuxupg upgrade vimrc, zshrc, and tmuxrc.
  '
}
