yt () { ydotool $@; }

show_keycodes () {
  cat /usr/include/linux/input-event-codes.h | less
}

keycodes () {
  run_function_as_root "showkey -k"
}

run_function_as_root () {
  echo $1 | xargs sudo -s
}

type_text () {
  yt type $1
}


# get_keycode () {
#   echo "Press a key..."
#   read -n 1 character; echo -n "$character" | od -An -tuC
# }
