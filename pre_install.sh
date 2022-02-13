if [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo '*** Installing for Linux ***'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo '*** Installing for Mac ***'

  echo '--- Installing xcode command line tools ---'
  xcode-select --install

  echo '--- Installing homebrew ---'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
