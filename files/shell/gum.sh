# helpers for gum
# https://github.com/charmbracelet/gum

gum_prompt() {
  # options for type: choose, file, filter, input, write
  # can use filter with: gum_prompt --type filter ok go
  #  or any other valid gum command
  # TODO fix this so that the order of flags doesn't matter
  prompt=$(flag_value_or_default "prompt" "Please provide a value:" $@)
  flag_is_present "prompt" $@ && shift && shift # remove the flag and its value

  type=$(flag_value_or_default "type" "input" $@)
  flag_is_present "type" $@ && shift && shift # remove the flag and its value

  value=$(gum $type --header="$prompt" $@)

  echo $value
}
