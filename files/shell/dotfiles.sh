
DOTFILES_DIR=~/.dotfiles/

ndf () { cd $DOTFILES_DIR; }

# dotfiles
# open project in IDE format: op<project>
opdf () { oide $DOTFILES_DIR;}
# pull dotfiles changes from remote repo
gedf () { local CURRDIR=`pwd`; ndf; ge; cd $CURRDIR; }

run_dotbot_install () {
  (
    ndf
    . ./dotbot_install.sh
  )
}
