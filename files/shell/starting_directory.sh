
nsd () { cd `cat ~/.starting_directory`; }

# set starting directory
ssd () {
  echo "$(pwd)" > ~/.starting_directory
  green "starting directory now set to: "
  cyan $(cat ~/.starting_directory); newline
}
