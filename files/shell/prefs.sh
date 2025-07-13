
# get merged preferences from ~/.prefs.json and ~/.prefs_private.json
# use yq to merge the two files
get_prefs() {
  local prefs_file="$HOME/.prefs.json"
  local private_prefs_file="$HOME/.prefs_private.json"

  if [[ -f "$prefs_file" && -f "$private_prefs_file" ]]; then
    yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' "$prefs_file" "$private_prefs_file"
  elif [[ -f "$prefs_file" ]]; then
    cat "$prefs_file"
  elif [[ -f "$private_prefs_file" ]]; then
    cat "$private_prefs_file"
  else
    echo "{}"
  fi
}
