# NOTE: currently there isn't anything calling this script
#  just adding it here so it can be run manually
git submodule update --remote dotbot

# if any changes were made to the dotbot submodule, commit them
if [[ -n $(git -C dotbot status --porcelain) ]]; then
  echo "updates were pulled from the dotbot repo"
  git add dotbot
  git commit
else
  echo "no updates were pulled from the dotbot repo"
fi
