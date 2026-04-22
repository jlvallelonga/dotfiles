#!/usr/bin/env bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  ./linux_install.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  ./mac_install.sh
fi

echo '--- Removing .zshrc file from home directory ---'
rm ~/.zshrc

echo '--- Creating src directory in home directory ---'
mkdir ~/src

echo '--- Creating ~/.starting_directory file ---'
# create the starting directory file with ~/src (the actual explicit path) as the default
(cd ~/src && echo `pwd` > ~/.starting_directory)

echo '--- Running dotbot install ---'
./dotbot_install.sh

echo '--- Running krew install ---'
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)


echo '--- Installing asdf ---'
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
(cd ~/.asdf && git checkout "$(git describe --abbrev=0 --tags)")
source $HOME/.asdf/asdf.sh

echo '--- Installing asdf plugins ---'
asdf plugin add nodejs
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add golang https://github.com/kennyp/asdf-golang.git

echo '--- Installing asdf versions ---'
# install via .tool-versions in home direcotry

# NOTE this is the only way I found that installing erlang works
asdf install erlang 23.3

(cd ~ && asdf install)

echo '--- Veifying asdf versions ---'
node --version
go version
elixir --version

echo '--- Installing oh my zsh ---'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
