export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.git-completion.bash

# misc
alias la='ls -lah'
# output my ip address
alias ip='ipconfig getifaddr en0'
alias cip='ipconfig getifaddr en0 | pbcopy'
# remove any rogue swap files
alias killswaps='find . -iname "*.sw[p|n|m]" | xargs rm'

# navigation
nsrc () { cd ~/src/; }
nssh () { cd ~/.ssh/; }
ndown () { cd ~/Downloads; }
ndesk () { cd ~/Desktop; }
nca () { nsrc; cd chalk_api/; }
nsing () { nsrc; cd singularity/; }
nec () { nsing; cd everycampus-api/; }
nnb () { nsing; cd nestjs-boilerplate/; }

# working with this file and similar files
alias bashpro="vim ~/.bash_profile"
alias bashrc="vim ~/.bashrc"
alias lbrc="less ~/.bashrc"
alias sbrc="source ~/.bashrc"

# git
alias gs='git status'
alias gsl='git stash list'
alias gss='git stash show -p'
alias gd='git diff'
gdni () { git diff --no-index $@; }
alias gdc='git diff --cached'
alias gl='git log'
alias glo='git log --oneline'
alias gb='git branch'
alias gbv='git branch -vv'
alias gbmm='git branch --merged master'
alias gbms='git branch --merged staging'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gp='git pull'
alias gf='git fetch --prune'
alias ge='git pull && git fetch --prune && git branch'
alias ga='git add'
alias gaa='git add .'
alias gaac='git add . && git commit'
#alias gca='git commit --amend'
alias gpoh='git push origin HEAD'
alias gpuoh='git push -u origin HEAD'

# docker
docker_started () { if ! docker ps; then return 0; else return 1; fi }
dco () { docker-compose $@; }
dcou () { dco up $@; }
dcob () { dco build $@; }
dcod () { dco down $@; }
dcoub () { dcou --build; }
dre () { kbp; dcod; dcoub; }
dcobash () { dco run $1 bash; }
dcor () { dco restart $@; }
dps () { docker ps; }

# elixir
alias ep="vim ~/elixir_play.exs"
alias rep="elixirc ~/elixir_play.exs"
# alias rps="psql api_dev -f ~/play.sql"
alias ie="vim ~/.iex.exs"

# other
kmps () { ps aux | grep 'mix phx.server' | grep -v grep | awk '{print "kill -9 " $2}' | bash; }
kism () { ps aux | grep 'iex -S mix' | grep -v grep | awk '{print "kill -9 " $2}' | bash; }
ke () { pkill psql; kmps; kism; }
kbp () { brew services stop postgres; }
sbp () { brew services start postgres; }

# elixir/phoenix
mps () { mix phx.server; }
mpr () { mix phx.routes; }
mprg () { mix phx.routes | grep $1; }
mdg () { mix deps.get; }
mfix () { mdg; mix deps.clean --unused --unlock; }
# an example of how to pass in all following arguments with $@
mt () { mix test $@; }
mtw () { mix test.watch; }
ism () { iex -S mix; }
tmem () { MIX_ENV=test mix ecto.migrate; }
tmer () { MIX_ENV=test mix ecto.rollback; }
tmere () { MIX_ENV=test mix ecto.drop; MIX_ENV=test mix ecto.create; MIX_ENV=test mix ecto.migrate; }
mem () { mix ecto.migrate; tmem; }
mer () { mix ecto.rollback; tmer; }
mere () { ke; mix ecto.reset; tmere; }
mpsg () { mix compile; mix phx.swagger.generate; }
mf () { mix format; }
mc () { mix compile; }

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

# jekyll
bejs () { bundle exec jekyll serve; }

# singularity
rdb () { npx knex-migrate down --to=0; npx knex migrate:latest; dropdb everycampus_test_1; dropdb everycampus_test_2; dropdb everycampus_test_3; dropdb everycampus_test_4; dropdb everycampus_test_5; dropdb everycampus_test_6; dropdb everycampus_test_7; }
yc () { yarn console; }
ys () { yarn serve; }
dcora () { dco run api $@; }
dbash () { dcora bash; }
dyc () { dcora yarn console; }
dyt () { dco run -e NODE_ENV=test api yarn jest $@; }
dytd () { dco run --service-ports api yarn test:debug:remote $@; }
boomboom () { dcod -v; dcob; }
boomtown () { dcod -v; dcob; dco run api yarn migrations; dcou; }
lf () { yarn eslint --fix "./**/*.js"; }
kpgc () { psql -c "select pg_terminate_backend(pid) from pg_stat_activity where pid <> pg_backend_pid() and datname = '$@'"; }
dbd () { kpgc everycampus_development; dropdb everycampus_development; createdb everycampus_development; psql -c "create role postgres with login createdb"; }
devinit () { docker-compose run api ./bin/dev_init.sh; }

# default working directory
nsrc

# allows history between iex sessions
export ERL_AFLAGS="-kernel shell_history enabled"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
