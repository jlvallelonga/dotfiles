#!/usr/bin/env bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  ./linux_bootstrap.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  ./mac_bootstrap.sh
fi

echo '--- Creating local-only files ---'
# create env and rc files that contain local only settings
touch ~/.zshenv_local
touch ~/.zshrc_local

echo '--- Creating src directory in home directory ---'
mkdir src

echo '--- Running dotbot install ---'
./install_dotbot.sh

echo '--- Installing asdf ---'
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
(cd ~/.asdf && git checkout "$(git describe --abbrev=0 --tags)")
source $HOME/.asdf/asdf.sh

echo '--- Installing asdf plugins ---'
asdf plugin-add nodejs
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

echo '--- Installing asdf versions ---'
(cd ~ && asdf install)

echo '--- Installing oh my zsh ---'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
