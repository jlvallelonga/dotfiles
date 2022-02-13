if [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo '*** Installing for Linux ***'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo '*** Installing for Mac ***'

  echo '--- Installing xcode command line tools ---'
  xcode-select --install


  echo '--- Installing homebrew ---'
  if brew -v > /dev/null 2>&1; then
    echo 'homebrew is already installed'
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
fi
