
nsd () { cd `cat ~/.starting_directory`; }

# set starting directory
ssd () {
  echo "$(pwd)" > ~/.starting_directory
  green "starting directory now set to: "
  cyan "$(cat ~/.starting_directory)"; newline
}

print_sd () {
  echo "$(cat ~/.starting_directory)"
}

esd () {
  ide `cat ~/.starting_directory`
}
