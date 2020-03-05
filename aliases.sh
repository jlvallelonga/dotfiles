

# misc
alias la='ls -lah'
# output my ip address
alias ip='ipconfig getifaddr en0'
alias cip='ipconfig getifaddr en0 | pbcopy'
# remove any rogue swap files
alias killswaps='find . -iname "*.sw[p|n|m]" | xargs rm'

# working with this file and similar files
alias bashpro="vim ~/.bash_profile"
alias bashrc="vim ~/.bashrc"
alias lbrc="less ~/.bashrc"
alias sbrc="source ~/.bashrc"
alias szrc="source ~/.zshrc"

# git
alias gs='git status'
alias gsl='git stash list'
alias gss='git stash show -p'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias glo='git log --oneline'
alias gb='git branch'
alias gbv='git branch -vv'
alias gbmm='git branch --merged master'
alias gbms='git branch --merged staging'
alias gbmd='git branch --merged development'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout development'
alias gp='git pull'
alias gf='git fetch --prune'
alias ga='git add'
alias gaa='git add .'
alias gaac='git add . && git commit'
#alias gca='git commit --amend'
alias gpoh='git push origin HEAD'
alias gpuoh='git push -u origin HEAD'

# elixir
alias ep="vim ~/elixir_play.exs"
alias rep="elixirc ~/elixir_play.exs"
# alias rps="psql api_dev -f ~/play.sql"
alias ie="vim ~/.iex.exs"

# rails
# alias rs='ifconfig en0 | grep "inet " | cut -d\  -f2 && rails server -b 0.0.0.0'
#
# # start elasticsearch process in the background
# alias es='elasticsearch -d'
#
# # kill elasticsearch process
# alias kes='ps ax | grep elasticsearch | grep -v grep | awk '\''{print "kill -9 " $1}'\'' | bash'
#
# # kill rails process
# alias kr='ps ax | grep rails | grep -v grep | awk '\''{print "kill -9 " $1}'\'' | bash'
