# || true is used to prevent the function from exiting with a non-zero status
press_any_key_to_continue () { read -q '?press any key to continue...' || true; }
error () { echo -e $(red "ERROR: $@"); }
print_exit_code_of_last_command () { echo $?; }
last_command_failed () { [ $? -ne 0 ]; }
# pass a failure message as an argument
require_success () {
  if last_command_failed; then
    echo $1
    exit 1
  fi
}


require_env_vars () {
  # pass the required env vars as arguments
  required_env_vars=("$@")

  for env_var in "${required_env_vars[@]}"; do
    if ! env_var_is_set $env_var; then
      echo "Missing value for env var: $env_var"
      exit 1
    fi
  done
}

env_var_is_set () {
  env_var=$1
  if is_bash; then
    [ -n "${!env_var}" ]
  elif is_zsh; then
    [ -n "${(P)env_var}" ]
  fi
}

require_dirs_exist () {
  # pass the required directories as arguments
  required_dirs=("$@")

  for dir in "${required_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
      echo "Directory does not exist: $dir"
      exit 1
    fi
  done
}

require_files_exist () {
  # pass the required files as arguments
  required_files=("$@")

  for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
      echo "File does not exist: $file"
      exit 1
    fi
  done
}

# the full path of the directory that the current script exists in
parent_dir () { dirname $1; }
deprecate () { echo "This function is deprecated. Use \"$1\" instead"; }
location_of_function () { echo "${functions_source[$1]}"; }

run_script () {
  script=$1
  shift # remove the first argument
  . $script $@;
}

is_bash () { [ -n "$BASH_VERSION" ]; }
is_zsh () { [ -n "$ZSH_VERSION" ]; }
current_session_shell () {
  if is_bash; then
    echo "bash"
  elif is_zsh; then
    echo "zsh"
  else
    echo "unknown"
  fi
}


noop () { :; }

# prints the full path of the script that this function is called from
this_script_location () {
  # define this function in the script that called this_script_location
  # make it a no-op so that it doesn't do anything but still works in bash
  temp_function_for_getting_location() { noop; }

  # now temp_function_for_getting_location will be in the functions_source array
  # and you can use that to get the location of the script that called this_script_location
  echo "${functions_source[temp_function_for_getting_location]}"
}

# usage: first_arg_or_piped $@
first_arg_or_piped () {
  if [ -t 0 ]; then
    echo $1
  else
    cat
  fi
}
