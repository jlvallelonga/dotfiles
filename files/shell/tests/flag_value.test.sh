assert_equal $(flag_value foo --foo one --bar two --z 3) "one"
assert_equal $(flag_value bar --foo one --bar two --z 3) "two"
assert_equal $(flag_value z --foo one --bar two --z 3) "3"
assert_equal $(flag_value does_not_exist  --foo one --bar two --z 3) ""
