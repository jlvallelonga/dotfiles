alias la='ls -AFhlas --color --group-directories-first $@'

sayhi () { echo "Hi there!"; }

set_test_env () { export RUN_TESTS=true; }
unset_test_env () { export RUN_TESTS=false; }

szrc () { deprecated "rl" --sleep 4; }
rl () { unset_test_env; reset_and_source; }
rlt () { set_test_env; reset_and_source; }
reset_and_source () {
  current_dir=$(pwd)
  reset;
  source ~/.zshrc;
  cd $current_dir;
}

# prints argument values with numbers
# usage: print_args $@
print_args () {
  piped=$(piped_value)

  if present $piped; then
    echo "Piped value: $piped"
  else
    echo "(No piped value)"
  fi

  if is_empty $1; then
    echo "(No arguments)"
  fi

  counter=1
  for i in "$@"; do
    echo "Arg $counter: $i"
    counter=$((counter+1))
  done
}

deprecated () {
  replacement=$1
  shift

  sleep_seconds=$(get_value_for_flag "sleep" $@)
  # print_args $@

  if is_empty $replacement; then
    error "You must provide a replacement function to the \"deprecated\" function"
    return 1
  fi

  echo "This function is deprecated. Use \"$replacement\" instead"

  if present $sleep_seconds; then
    # echo "Sleeping for $sleep_seconds seconds"
    sleep $sleep_seconds
    shift
    shift
  fi

  echo "Running \"$replacement $@\""
  $replacement $@
}

separator () { echo "------------------------------------"; }

kill_terminal () { exit 0; }
alias kt='kill_terminal'

print_with_line_numbers () {
  echo -e "$(piped_or_first_arg $@)" | cat -n;
}

where_is () {
  # whence -v $1
  response=$(whence -v $1)
  # use awk to get the last value
  echo $response | awk '{print $NF}'
  # arr=($response)
  # echo "array " ${arr[@]}
  # # return the last value which is the path of the function
  # echo ${arr[-1]}
}


nard () { nsrc; cd arduino; }

list_users () { cat /etc/passwd | cut -d: -f1 | sort; }


# rg (repgrep) searching all hidden and ignored files
rga () { rg --hidden --no-ignore $@; }

# restart_gnome () { busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s 'Meta.restart("Restarting…")'; }

# jekyll
bejs () { bundle exec jekyll serve; }

# other
# kill everything
ke () { pkill psql; kmps; kism; }
# Doctor?
dre () { kbp; dcod; dcoub; }
# finds the word debugger in the current directory
# can use like `debugger_in_dir && echo foo`
debugger_in_dir () { if [[ $(rg debugger) ]]; then return 0; else return 1; fi }

br () {
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        xdg-open $@;
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        open $@;
    fi
}

newline () { echo ""; }


make_it_mine () {
  if [[ -z "$1" ]]; then
    echo "Usage: make_it_mine <file>"
    return 1
  fi

  file=$1
  if [[ -f $file ]]; then
    echo "Making $file mine"
    sudo chown $USER:$USER $file
  else
    echo "File not found: $file"
    return 1
  fi
}
