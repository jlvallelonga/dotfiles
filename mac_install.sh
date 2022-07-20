#!/usr/bin/env bash

echo '--- Creating local-only hammerspoon file ---'
touch ~/.hammerspoon_local.lua

echo '--- Updating mac settings ---'
defaults write -g ApplePressAndHoldEnabled -bool false
echo '  NOTE: key repeat settings will be applied on restart'

echo '--- Updating brew ---'
brew update

echo '--- Setting up brew taps ---'
brew tap mongodb/brew
brew tap hashicorp/tap
brew tap nats-io/nats-tools

echo '--- Installing brew packages ---'
# requirements for asdf and asdf plugins
brew install coreutils
brew install gnupg
brew install autoconf
brew install openssl
brew install wxmac
# other packages
brew install ripgrep
brew install protobuf
brew install sops
brew install awscli
brew install aws-vault
brew install kubectx
brew install cue-lang/tap/cue
brew install mongodb-database-tools
brew install hashicorp/tap/vault
brew install nats-io/nats-tools/nats

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
brew install --cask insomnia
brew install --cask karabiner-elements
brew install --cask mongodb-compass
brew install --cask discord
brew install --cask spotify
