
copy_to_clipboard () {
  arg=$(first_arg_or_piped $@)
  # if pbcopy is not available, use xclip
  if command -v pbcopy &> /dev/null; then
    echo $arg | pbcopy
  else
    echo $arg | xclip -selection clipboard
  fi
}
alias ctc=copy_to_clipboard
