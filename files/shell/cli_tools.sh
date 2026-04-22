gen_cli_tool () { run_script /home/jlvallelonga/src/cli_tools/_core/generate.sh $1; }
alias gencli=gen_cli_tool
nct () { cd ~/src/cli_tools/$1; }
opct () { deprecated "ect"; }
ect () { ide ~/src/cli_tools/; }

nb () { cd ~/bin;}

uninstall_cli_tool () { rm ~/bin/$1; }
