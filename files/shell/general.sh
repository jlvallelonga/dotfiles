# misc
# alias la='echo "Size\tPerms\tLinks\tOwner\tGroup\tSize\tMod. Time\tName"; ls -AFhlas --color --group-directories-first'
alias la='ls -AFhlas --color --group-directories-first'
# remove any rogue swap files
alias killswaps='find . -iname "*.sw[p|n|m]" | xargs rm'
# source zshrc
alias szrc="deprecate rl; source ~/.zshrc"
alias rl="source ~/.zshrc"

alias loadDotEnv='export $(cat .env | xargs)'

nard () { nsrc; cd arduino; }

list_users () { cat /etc/passwd | cut -d: -f1 | sort; }


# rg (repgrep) searching all hidden and ignored files
rga () { rg --hidden --no-ignore $@; }

# restart_gnome () { busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s 'Meta.restart("Restarting…")'; }

# jekyll
bejs () { bundle exec jekyll serve; }

# other
# kill everything
ke () { pkill psql; kmps; kism; }
# Doctor?
dre () { kbp; dcod; dcoub; }
# finds the word debugger in the current directory
# can use like `debugger_in_dir && echo foo`
debugger_in_dir () { if [[ $(rg debugger) ]]; then return 0; else return 1; fi }

br () {
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        xdg-open $@;
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        open $@;
    fi
}
