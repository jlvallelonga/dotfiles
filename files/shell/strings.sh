copy_from_key() {
  if [ -z "$1" ]; then
    echo "Please provide a key to copy"
    return 1
  fi

  key=$1

  value=$(cat ~/.strings.yml | yq -r ".$key")
  echo "value: $value ok"

  copy_to_clipboard "$value"
}
alias cfk=copy_from_key

type_from_key() {
  sleep_seconds=$(flag_value "sleep" $@)
  if present $sleep_seconds; then
    # remove the flag and its value now that we have captured it
    shift
    shift
  fi

  if [ -z "$1" ]; then
    echo "Please provide a key to type"
    return 1
  fi
  key=$1

  value=$(cat ~/.strings.yml | yq -r ".$key")

  if present $sleep_seconds; then
    # echo "Sleeping for $sleep_seconds seconds"
    sleep $sleep_seconds
  fi

  type_text "$value"
}
alias tfk=type_from_key

replace_string() {
  if [ -z "$1" ]; then
    echo "Please provide a string to modify"
    return 1
  fi

  if [ -z "$2" ]; then
    echo "Please provide a string to search for"
    return 1
  fi

  if [ -z "$3" ]; then
    echo "Please provide a string to replace with"
    return 1
  fi

  str=$1
  search=$2
  replace=$3

  echo $str | sed "s/$search/$replace/g"
}

print_number_with_commas() {
  if [ -z "$1" ]; then
    echo "Please provide a number to format"
    return 1
  fi

  num=$1

  echo $num | awk '{printf "%\047d\n", $1}'
}
