#!/usr/bin/env bash

echo '*** Installing for Mac ***'

echo '--- Installing xcode command line tools ---'
xcode-select --install

echo '--- Updating brew ---'
brew update

echo '--- Installing oh my zsh ---'
# install oh my zsh first
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo '--- Installing brew packages ---'
brew install ripgrep

echo '--- Installing brew casks ---'
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
