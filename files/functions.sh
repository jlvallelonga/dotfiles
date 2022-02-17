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
gb () { git branch $@; }
gcom () { git checkout master > /dev/null 2>&1 || git checkout main; }
gst () { git status; }
gbmm () { git branch --merged master > /dev/null 2>&1 || git branch --merged main; }
gbmd () { git branch --merged development > /dev/null 2>&1 || git branch --merged dev; }
gcod () { git checkout development > /dev/null 2>&1 || git checkout dev; }

# open IDE with args
oide () { code $@; }
oph () { oide ~; }

# dotfiles
# open project in IDE format: op<project>
opdf () { oide $DOTFILES_DIR;}
# pull dotfiles changes from remote repo
gedf () { local CURRDIR=`pwd`; ndf; ge; cd $CURRDIR; }

# docker
docker_started () {
    if docker ps > /dev/null 2>&1; then
        # docker is running
        return 0;
    else
        # docker is NOT running
        return 1;
    fi
}
start_docker () {
    if ! docker_started; then
        echo "Docker not started. Starting now.";
        open -a Docker;
    fi
    max_retry=30
    retry=0
    while [ ${retry} -lt ${max_retry} ]; do
        if docker_started; then
            break
        else
            echo "docker not yet started";
            (( retry = retry + 1 ))
            sleep 1;
        fi
    done
}
dcomp () { start_docker; dco $@; }
dcou () { dcomp up $@; }
dcob () { dcomp build $@; }
dcod () { dcomp down $@; }
dcoub () { dcou --build; }
dcor () { dcomp restart $@; }
dps () { start_docker; docker ps; }
dbash () { start_docker; docker exec -it $1 bash; }

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
gmt () { go mod tidy; }
gmd () { go mod download; }
gt () { go test ./...; }

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
br () {
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        xdg-open $@;
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        open $@;
    fi
}

ohome () { oide ~;}
