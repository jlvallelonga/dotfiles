SRC_DIR=~/src/
SSH_DIR=~/.ssh/
DOTFILES_DIR=~/.dotfiles/

# navigation - format: n<location or project>
ndf () { cd $DOTFILES_DIR; }
nsrc () { cd $SRC_DIR; }
nssh () { cd $SSH_DIR; }
ndown () { cd ~/Downloads; }
ndesk () { cd ~/Desktop; }
nard () { nsrc; cd arduino; }
nsd () { cd `cat ~/.starting_directory`; }

# git
# diff files that aren't in a git repo
gdni () { git diff --no-index $@; }
ge () { git pull && git fetch --prune && git branch; }

# open IDE with args
oide () { code $@; }

# dotfiles
# open project in IDE format: op<project>
opdf () { oide $DOTFILES_DIR;}
# pull dotfiles changes from remote repo
gedf () { local CURRDIR=`pwd`; ndf; ge; cd $CURRDIR; }

# docker
docker_started () { if ! docker ps; then return 0; else return 1; fi }
# dco () { docker-compose $@; } # commenting this because it's a built in alias with the docker-compose ohmyzsh plugin
dcou () { dco up $@; }
dcob () { dco build $@; }
dcod () { dco down $@; }
dcoub () { dcou --build; }
dcobash () { dco run $1 bash; }
dcor () { dco restart $@; }
dps () { docker ps; }

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

# jekyll
bejs () { bundle exec jekyll serve; }

# go
gog () { go get $@; asdf reshim golang; }
goi () { go install $@; asdf reshim golang; }

# other
kmps () { ps aux | grep 'mix phx.server' | grep -v grep | awk '{print "kill -9 " $2}' | bash; }
kism () { ps aux | grep 'iex -S mix' | grep -v grep | awk '{print "kill -9 " $2}' | bash; }
# kill everything
ke () { pkill psql; kmps; kism; }
# kill brew postgres
kbp () { brew services stop postgres; }
# start brew postgres
sbp () { brew services start postgres; }
# Doctor?
dre () { kbp; dcod; dcoub; }
# set starting directory
ssd () { echo `pwd` > ~/.starting_directory; }
# finds the word debugger in the current directory
# can use like `debugger_in_dir && echo foo`
debugger_in_dir () { if [[ $(rg debugger) ]]; then return 0; else return 1; fi }

ohome () { oide ~;}
