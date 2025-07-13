alias la='ls -AFhlas --color --group-directories-first $@'
alias tf='tail -f $@'

scratch () { ide ~/scratch.txt; }
alias notes='scratch'

nb () { cd ~/bin;}

# set project (and open)
sp () { ssd; code .; }

sayhi () { echo "Hi there!"; }

state_abbreviations () { echo "AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA KS KY LA ME MH MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND MP OH OK OR PW PA PR RI SC SD TN TX UT VT VI VA WA WV WI WY"; }

print_line_range () {
  start=$1
  shift
  echo "start: $start"

  end=$1
  shift
  echo "end: $end"

  file_contents=$(piped_value $@)
  file_path=$1
  if empty $file_contents && empty $file_path; then
    echo "No file specified"
    echo "Usage: print_range <start> <end>"
    return 1
  fi

  if

  if [[ -z "$start" || -z "$end" ]]; then
    echo "missing start or end"
    echo "Usage: print_range <start> <end>"
    return 1
  fi

  if present $file_contents; then
    echo "$file_contents" | sed -n "$start,$end p"
  else
    sed -n "$start,$end p" "$file_path"
  fi
}

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

  if empty $1; then
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

  sleep_seconds=$(flag_value "sleep" $@)
  # print_args $@

  if empty $replacement; then
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
  echo -e "$(piped_or_next_arg $@)" | cat -n;
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

untargz () {
  if [[ -z "$1" ]]; then
    echo "Usage: untargz <file>"
    return 1
  fi

  file=$1
  if [[ -f $file ]]; then
    echo "Untargzipping $file"
    tar -xvzf $file
  else
    echo "File not found: $file"
    return 1
  fi
}

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

  dir_of_file=$(dirname $file)
  ls -la $dir_of_file | grep $(basename $file)
}

screen_backlight_fully_down () {
  for i in {1..20}; do
    type_key $KEY_BACKLIGHT_DOWN
  done
}

screen_backlight_normal () {
  for i in {1..10}; do
    type_key $KEY_BACKLIGHT_UP
  done
}

keyboard_backlight_fully_down () {
  for i in {1..5}; do
    type_key $KEY_KEYBOARD_BRIGHTNESS_DOWN
  done
}

keyboard_backlight_normal () {
  for i in {1..5}; do
    type_key $KEY_KEYBOARD_BRIGHTNESS_UP
  done
}

sleep_mode () {
  screen_backlight_fully_down
  keyboard_backlight_fully_down
}

wake_mode () {
  screen_backlight_normal
  keyboard_backlight_normal
}

illuminate_keyboard () {
  type_key $KEY_KEYBOARD_BRIGHTNESS_DOWN
  type_key $KEY_KEYBOARD_BRIGHTNESS_UP
}

starbucks_wifi () {
  type_text $(kvg first_name)
  type_key $KEY_TAB
  type_text $(kvg last_name)
  type_key $KEY_TAB
  type_key $KEY_TAB
  type_text $(kvg passport)
  type_key $KEY_TAB
  type_text $(kvg phone)
  type_key $KEY_TAB
  type_text $(kvg email)
  type_key $KEY_TAB
  type_key $KEY_SPACE
}

window_left () {
  type_combo $KEY_LEFTMETA $KEY_LEFT
}
