assert_equal $(flag_value_or_default foo five --foo one --bar two --z 3) "one"
assert_equal $(flag_value_or_default foo five --notfoo one --bar two --z 3) "five"
