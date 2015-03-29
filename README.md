# Zsh Configuration

[![MIT License](https://img.shields.io/badge/license-MIT-red.svg)](./LICENSE.txt)

My complete Zsh configuration as a Zsh plugin.

## Description

This configuration system works as a meta-plugin:
all desired Zsh plugins are loaded from `plugins.zsh` using [zgen].
Overall configuration then follows a normal plugin structure.

[zgen]: https://github.com/tarjoilija/zgen

## Installation

### Automatic Install

You can install this via the command-line with either curl

```bash
$ curl -L https://git.io/jggP | sh
```

or wget

```bash
$ wget https://git.io/jggP -O - | sh
```

### Manual Install

1. Install [zgen] to `~/.zgen.zsh/zgen.zsh`.
2. Create `~/.zshrc` with

```zsh
# razor-x/zshrc

source "${HOME}/.zgen.zsh/zgen.zsh"

BRANCH='master'

if [[ -d "${HOME}/.zgen/local/zshrc-${BRANCH}" ]]; then
  source "${HOME}/.zgen/local/zshrc-${BRANCH}/plugins.zsh"
elif [[ -d "${HOME}/.zgen/razor-x/zshrc-${BRANCH}" ]]; then
  source "${HOME}/.zgen/razor-x/zshrc-${BRANCH}/plugins.zsh"
else
  zgen load razor-x/zshrc plugin $BRANCH
  zgen update
  echo
  echo '  ✔ Installed zshrc as zgen plugin!'
  echo
  echo '  ➤ Press any key to exit this shell.'
  echo '  ➤ Open a new shell to finish setup.'
  read -s -n 1
  exit 0
fi
```

## Updating

Updating is handled via the normal [zgen] update commands.

## Customization

You can customize this configuration or manage your own in the same way.

1. Clone or fork this.
   If you prefer a clean start, clone the `minimal` branch:
   it has the same structure and development tools but with
   a very minimal configuration.
2. Replace any instance of `razor-x/zshrc`
   with the path to your repository's location.
   If you do not host this on GitHub,
   you may need to adjust the repository path appropriately.
3. Customize package.json.
4. Update `install.sh` on the `gh-pages` branch.
5. Update the urls for the install script in this README.

Here is an example of a command you can use to make replacements:

```bash
$ git ls-files -z | xargs -0 sed -i 's/razor-x\/zshrc/username\/zshrc/g'
```

## Contributing

Please submit and comment on bug reports and feature requests.

To submit a patch:

1. Fork it (https://github.com/razor-x/zshrc/fork).
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Make changes.
4. Commit your changes (`git commit -am 'Add some feature'`).
5. Push to the branch (`git push origin my-new-feature`).
6. Create a new Pull Request.

## License

This zsh configuration is licensed under the MIT license.

## Warranty

This software is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantibility and fitness for a particular
purpose.
