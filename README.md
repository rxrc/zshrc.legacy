# Zsh Configuration

[![Release](https://img.shields.io/github/release/rxrc/zshrc.svg)](https://github.com/rxrc/zshrc/releases)
[![MIT License](https://img.shields.io/github/license/rxrc/zshrc.svg)](./LICENSE.txt)

My complete Zsh configuration as a Zsh plugin.

## Description

This configuration system works as a meta-plugin:
all desired Zsh plugins are loaded from `plugins.zsh` using [zgen].
Overall configuration then follows a normal plugin structure.

[zgen]: https://github.com/tarjoilija/zgen

## Installation

### Automatic Install

You can install this via the command-line with either curl

```
$ curl -L https://git.io/vJAEY | sh
```

or wget

```
$ wget https://git.io/vJAEY -O - | sh
```

### Manual Install

1. Install [zgen] to `~/.zgen.zsh/zgen.zsh`.
2. Create `~/.zshrc` with

```zsh
# rxrc/zshrc

branch="${ZSHRC_BRANCH:-master}"

source "${HOME}/.zgen.zsh/zgen.zsh"

if [[ -d "${HOME}/.zgen/local/zshrc-${branch}" ]]; then
  source "${HOME}/.zgen/local/zshrc-${branch}/plugins.zsh"
elif [[ -d "${HOME}/.zgen/rxrc/zshrc-${branch}" ]]; then
  source "${HOME}/.zgen/rxrc/zshrc-${branch}/plugins.zsh"
else
  zgen load rxrc/zshrc plugin $branch
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

Here is an example of a Zsh function that will provide a one-step update:

```zsh
# Upgrade zshrc.
function zshupg () {
  if ! [[ -d $HOME/.zgen.zsh ]]; then
    echo 'zgen is not installed.'
    exit 1
  fi

  zgen selfupdate
  zgen update
}
```

## promptline.vim

This configuration will load `~/.promptline.zsh`
which can be generated or updated using [promptline.vim]
by running `:PromptlineSnapshot! ~/.promptline.zsh` from Vim.

[promptline.vim]: https://github.com/edkolev/promptline.vim


## Customization

You can customize this configuration or manage your own in the same way.

1. Clone or fork this.
   If you prefer a clean start, clone the `minimal` branch:
   it has the same structure and development tools but with
   a very minimal configuration.
   Tagged releases are based on that branch.
2. Replace any instance of `rxrc/zshrc`
   with the path to your repository's location.
   If you do not host this on GitHub,
   you may need to adjust the repository path appropriately.
3. Customize package.json.
4. Update `install.sh` on the `gh-pages` branch.
5. Update the urls for the install script in this README.

Here is an example of a command you can use to make replacements:

```
$ git ls-files -z | xargs -0 sed -i 's/rxrc\/zshrc/username\/zshrc/g'
```

## Development

You can use [Gulp] to switch to development mode
which will configure zgen to use the development
directory as the plugin path.

First, follow the normal install steps if you haven't already.
Then, install the development dependences via [npm] with

```
$ npm install
```

Enter development mode with

```
$ npm run dev
```

After entering development mode,
have gulp watch for changes with

```
$ npm run watch
```

To switch out of development mode run

```
$ npm run nodev
```

[Gulp]: http://gulpjs.com/
[npm]: https://www.ruby-lang.org/en/

## Contributing

Please submit and comment on bug reports and feature requests.

To submit a patch:

1. Fork it (https://github.com/rxrc/zshrc/fork).
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
