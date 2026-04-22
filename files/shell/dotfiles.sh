
DOTFILES_DIR=~/.dotfiles/

ndf () { cd $DOTFILES_DIR; }

opdf () { deprecated "edf"; }
edf () { ide $DOTFILES_DIR; }

# pull dotfiles changes from remote repo
gedf () {
  (
    printf "pulling latest changes from dotfiles repo..."
    ndf
    ge
    echo "done"
  )
}

run_dotbot_install () {
  (
    ndf
    . ./dotbot_install.sh
  )
}
alias rdi=run_dotbot_install


find_usage_of_function () {
  function_name=$1

  rga "$function_name" $DOTFILES_DIR
}
