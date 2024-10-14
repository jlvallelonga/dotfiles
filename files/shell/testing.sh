# actual, expected
assert_equal () {
  actual=$1
  expected=$2

  if present $3; then
    fail_message=$3
  else
    fail_message="expected $expected but got $actual"
  fi

  if [ $actual = $expected ]; then
    pass
  else
    fail $fail_message
  fi
}

pass () {
  green "."
  return 0
}

fail () {
  error $1
  return 1
}
