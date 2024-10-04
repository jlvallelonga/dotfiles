
nsd () { cd `cat ~/.starting_directory`; }

# set starting directory
ssd () { echo `pwd` > ~/.starting_directory; echo "starting directory now set to: "; cat ~/.starting_directory; }
