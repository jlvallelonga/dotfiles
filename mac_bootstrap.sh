#!/usr/bin/env bash

echo '--- Updating brew ---'
brew update

echo '--- Installing requirements for asdf via brew ---'
brew install coreutils
brew install gnupg
brew install autoconf
brew install openssl
brew install wxmac

echo '--- Installing brew packages ---'
brew install ripgrep

echo '--- Creating local-only hammerspoon file ---'
touch ~/.hammerspoon_local.lua

echo '--- Installing brew casks ---'

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
