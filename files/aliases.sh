# misc
alias la='ls -lah'
# output my ip address
alias ip='ipconfig getifaddr en0'
# output my ip address and copy to clipboard (mac only)
alias cip='ipconfig getifaddr en0 | pbcopy'
# remove any rogue swap files
alias killswaps='find . -iname "*.sw[p|n|m]" | xargs rm'
# source zshrc
alias szrc="source ~/.zshrc"


alias loadDotEnv='export $(cat .env | xargs)'


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

# elixir
alias ep="vim ~/elixir_play.exs"
alias rep="elixirc ~/elixir_play.exs"
alias ie="vim ~/.iex.exs"

# docker
alias dco='docker compose'
