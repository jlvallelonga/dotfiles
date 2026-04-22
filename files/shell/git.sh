GITHUB_USERNAME='jlvallelonga'

# git
alias gsl='git stash list'
alias gss='git stash show -p'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias glo='git log --oneline'
alias gbv='git branch -vv'
alias gp='git pull'
alias gf='git fetch --prune'
alias ga='git add'
alias gaa='git add .'
alias gaac='git add . && git commit'
#alias gca='git commit --amend' # commented because it's built in already
alias gpoh='git push origin HEAD'
alias gpuoh='git push -u origin HEAD'

# git
# diff files that aren't in a git repo
gdni () { git diff --no-index $@; }
ge () { git pull && git fetch --prune && git branch; }
gb () { git branch $@; }
gcom () { git checkout master > /dev/null 2>&1 || git checkout main; }
gst () { git status; }
gbmm () { git branch --merged master > /dev/null 2>&1 || git branch --merged main; }
gbmd () { git branch --merged development > /dev/null 2>&1 || git branch --merged dev; }
gbmdd() { gbmd | grep -v "\*" | xargs -n 1 git branch -d; }
gcod () { git checkout development $@ > /dev/null 2>&1 || git checkout dev $@; }
