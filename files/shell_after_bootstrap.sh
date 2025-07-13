# start shell at starting directory
nsd

# load path from the path_dirs file
load_path_from_file

# run tests if the RUN_TESTS env var is set

# to run tests, use the `rlt` alias which sets the env var and then resets
# purposfully loading this after the bootstrapping process because all of the functions need to be loaded first
if [ "$RUN_TESTS" = "true" ]; then
  run_shell_function_tests
fi

# then anything you just want to mess with after all the functions have loaded

new_version () {
  repo="ReimuNotMoe/ydotool"
  # get the latest release tag
  latest_tag=$(curl -s https://api.github.com/repos/$repo/releases/latest | grep "tag_name" | cut -d '"' -f 4)

  echo "latest tag: $latest_tag"

  # curl -s https://api.github.com/repos/jgm/pandoc/releases/latest \
  # | grep "browser_download_url.*deb" \
  # | cut -d : -f 2,3 \
  # | tr -d \" \
  # | wget -qi -


  #
  # https://mikefarah.gitbook.io/yq/operators/assign-update#update-string-value
}

# new_version

# https://github.com/ReimuNotMoe/ydotool/releases/download/v1.0.4/ydotool-release-ubuntu-latest


# echo "a" | keycodes
