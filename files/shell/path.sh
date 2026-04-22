
# add a path to the ~./path_dirs file
apd () { echo $1 >> ~/.path_dirs; }
ppd () { cat ~/.path_dirs; }
opd () { oide ~/.path_dirs; }
path () { echo $PATH; }
# split path into lines and print it
p () { echo $PATH | tr ':' '\n' | sort; }

# remove duplicate values from $PATH
remove_path_env_duplicates () { export PATH=$(echo -n $PATH | awk -v RS=: -v ORS=: '!a[$0]++'); }

load_path_from_file () {
  # load all directories from ~/.path_dirs into PATH
  for dir in $(cat ~/.path_dirs); do
    export PATH="$dir:$PATH"
  done
}

path_functions_location() {
  this_script_location
}
