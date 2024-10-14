assert_equal $(get_value_for_flag foo --foo one --bar two --z 3) "one"
assert_equal $(get_value_for_flag bar --foo one --bar two --z 3) "two"
assert_equal $(get_value_for_flag z --foo one --bar two --z 3) "3"
