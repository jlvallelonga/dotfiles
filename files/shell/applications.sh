
alias tetrigo='tetrigo --db="/var/lib/tetrigo/tetrigo.db"'
alias lg='lazygit'

arduino () { open_app "arduino" "$@"; }
cursor () { open_app "cursor" "$@"; }
kdenlive () { open_app "kdenlive" "$@"; }
openshot () { open_app "openshot" "$@"; }
obsidian () { open_app "obsidian" "$@"; }

# TODO rather than doing this, make a symlink from the applications directory to the bin directory in home
open_app () {
  local app=$1
  local appsDir="$HOME/applications"
  local logFile="$appsDir/$app.log"

  filesInDir=$(ls -AC1 --color=never $appsDir)
  if ! echo "$filesInDir" | grep -qi "$app"; then
    echo "App not found: $app"
    return 1
  fi

  appPath=$(find $appsDir -iname "$app*.AppImage")
  echo "Opening $app at: $appPath"

  if [ -z "$appPath" ]; then
    echo "App not found: $app"
    return 1
  fi

  nohup $appPath "$@" > $logFile & disown;
}
