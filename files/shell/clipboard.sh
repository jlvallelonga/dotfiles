
copy_to_clipboard () {
  arg=$(piped_or_first_arg $@)
  # if pbcopy is not available, use xclip
  if command -v pbcopy &> /dev/null; then
    echo -n "$arg" | pbcopy
  else
    echo -n "$arg" | xclip -selection clipboard
  fi
}
alias ctc=copy_to_clipboard
