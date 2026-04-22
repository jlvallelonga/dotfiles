
assert_equal $(echo "foo" | piped_or_first_arg) "foo"
assert_equal $(piped_or_first_arg "foo") "foo"
assert_equal $(echo "foo" | piped_or_first_arg "bar") "foo"
assert_equal $(piped_or_first_arg "foo" "bar" "baz") "foo"
assert_equal $(echo "foo" | piped_or_first_arg "bar" "baz") "foo"
assert_equal $(piped_or_first_arg) ""
