#!/usr/bin/env bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo 'Installing for Linux'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  ./mac_bootstrap.sh
fi


./install_dotbot.sh
