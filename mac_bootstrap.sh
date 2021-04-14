#!/usr/bin/env bash

echo 'Installing for Mac'

xcode-select --install

brew update

# install oh my zsh first
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install ripgrep
brew install asdf

# if using atom uncomment these:
# brew cask install atom
# apm install package-sync

# caskable programs
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask hammerspoon
brew install --cask spectacle
brew install --cask postico
brew install --cask docker
brew install --cask zoom
brew install --cask slack
brew install --cask visual-studio-code
