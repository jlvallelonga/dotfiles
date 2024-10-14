# defines the bootstrap_dir function which is useful for sourcing all files in a directory (or all that match a pattern in that directory)
# and then sources all files in the ~/.shell directory
# this is intended to be used in the ~/.bashrc or ~/.zshrc file
# other functions and such can be added to the ~/.shell directory and they will be sourced with this script

bootstrap_dir() {
  if [ -z "$1" ]; then
    echo "Usage: bootstrap_dir <directory> [\"file_pattern\"] [\"exclude_pattern\"]"
    return 1
  fi
  directory=$1
  shift

  if [ -z "$1" ]; then
    file_pattern="*.sh"
  else
    # must pass in using quotes otherwise the shell will expand the wildcard before the function is called
    file_pattern=$1
    shift
  fi

  find_opts="-L $directory -maxdepth 1 -type f -name $file_pattern"

  # if there's an exclude pattern, use it
  if [ -n "$1" ]; then
    # add exclude pattern to find_opts
    find_opts="$find_opts ! -name $1"
    shift
  fi

  # echo "find_opts: $find_opts"

  files=($(echo "$find_opts" | xargs find))
  # echo "number of files: ${#files[@]}"
  for file in $files; do
    source $file
  done
}

# bootstrap_dir ~/.shell "*.foo" "*.bar"
bootstrap_dir ~/.shell "*.sh" "*.test.sh"
# bootstrap_dir ~/.shell "*.sh"
