# yt () { sleep 2; ydotool $@; }
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
  text=$(piped_or_next_arg $@)
  yt type "$text"
}

type_key () {
  keycode=$1
  yt key $keycode:1 $keycode:0
}

type_combo () {
  # loop through all arguments and press them down
  for keycode in "$@"; do
    yt key $keycode:1
  done

  # loop through all arguments and release them
  for keycode in "$@"; do
    yt key $keycode:0
  done
}

# keycodes:
# backlight brightness up: 225
# backlight brightness down: 224
# keyboard brightness up: 230
# keyboard brightness down: 229


# get_keycode () {
#   echo "Press a key..."
#   read -n 1 character; echo -n "$character" | od -An -tuC
# }
