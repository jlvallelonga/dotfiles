assert_equal $(echo "foo" | piped_or_next_arg) "foo"
assert_equal $(piped_or_next_arg "foo") "foo"

assert_equal $(echo "foo" | piped_or_next_arg "bar") "foo"
assert_equal $(piped_or_next_arg "foo" "bar" "baz") "foo"

assert_equal $(echo "foo" | piped_or_next_arg "bar" "baz") "foo"
assert_equal $(piped_or_next_arg) ""

# with flags
assert_equal $(echo "foo" | piped_or_next_arg --key thing) "foo"
assert_equal $(piped_or_next_arg foo --key thing) "foo"
