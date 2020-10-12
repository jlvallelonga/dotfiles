#!/usr/bin/env bash

echo 'Installing for Mac'

brew update

# install oh my zsh first
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# if using atom uncomment these:
# brew cask install atom
# apm install package-sync

# always install ripgrep
brew install ripgrep
