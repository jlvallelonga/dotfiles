# defines the bootstrap_dir function which is useful for sourcing all files in a directory (or all that match a pattern in that directory)
# and then sources all files in the ~/.shell directory
# this is intended to be used in the ~/.bashrc or ~/.zshrc file
# other functions and such can be added to the ~/.shell directory and they will be sourced with this script

bootstrap_dir() {
  if [ -z "$1" ]; then
    echo "Usage: bootstrap_dir <directory> [\"file_pattern\"] (file_pattern defaults to *.sh)"
    return 1
  fi
  directory=$1; shift

  if [ -z "$@" ]; then
    file_pattern=*.sh
  else
    # must pass in using quotes otherwise the shell will expand the wildcard before the function is called
    file_pattern=$@
  fi

  files=($(find -L "$directory" -maxdepth 1 -type f -name $file_pattern))
  for file in $files; do
    source $file
  done
}

bootstrap_dir ~/.shell
