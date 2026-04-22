datetime_stamp () {
  stamp=$(date +"%Y%m%d%H%M%S")
  echo $stamp | copy_to_clipboard
  echo $stamp | type_text
}
