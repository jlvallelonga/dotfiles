SRC_DIR=~/src/
SSH_DIR=~/.ssh/
DOTFILES_DIR=~/.dotfiles/
GITHUB_USERNAME='jlvallelonga'

# colors
NC='\033[0m' # No Color
NORMAL="\033[0;39m"

BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
PINK="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"

source ./functions/bash.sh


# playground
np () { cd ~/playground; }
opp () { oide ~/playground; }

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
gbmdd() { gbmd | grep -v "\*" | xargs -n 1 git branch -d; }
gcod () { git checkout development $@ > /dev/null 2>&1 || git checkout dev $@; }

# open IDE with args
oide () { code $@; }
oph () { oide ~; }
# open working directory in IDE
opwd () { oide `pwd`; }

# rg (repgrep) searching all hidden and ignored files
rga () { rg --hidden --no-ignore $@; }

# dotfiles
# open project in IDE format: op<project>
opdf () { oide $DOTFILES_DIR;}
# pull dotfiles changes from remote repo
gedf () { local CURRDIR=`pwd`; ndf; ge; cd $CURRDIR; }

# add a path to the ~./path_dirs file
apd () { echo $1 >> ~/.path_dirs; }
ppd () { cat ~/.path_dirs; }
epd () { oide ~/.path_dirs; }
path () { echo $PATH; }
# split path into lines and print it
p () { echo $PATH | tr ':' '\n' | sort; }

# remove duplicate values from $PATH
remove_path_env_duplicates () { export PATH=$(echo -n $PATH | awk -v RS=: -v ORS=: '!a[$0]++'); }

# alphabetize env vars and print
e () { env | sort  }

restart_gnome () { busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s 'Meta.restart("Restarting…")' }

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
# start_docker () {
#     if ! docker_started; then
#         echo "Docker not started. Starting now.";
#         open -a Docker;
#         # open -a Orbstack;
#     fi
#     max_retry=30
#     retry=0
#     while [ ${retry} -lt ${max_retry} ]; do
#         if docker_started; then
#             break
#         else
#             echo "docker not yet started";
#             (( retry = retry + 1 ))
#             sleep 1;
#         fi
#     done
# }
# dcomp () { start_docker; dco $@; }
dcomp () { dco $@; }
dcou () { dcomp up $@; }
dcob () { dcomp build $@; }
dcod () { dcomp down $@; }
dcoub () { dcou --build; }
dcor () { dcomp restart $@; }
# dps () { start_docker; docker ps; }
# dps () { docker ps; }
# dbash () { start_docker; docker exec -it $1 bash; }
dbash () { docker exec -it $1 bash; }
dreset () {
    echo "--- docker compose down --volumes ---"
    docker compose down -v;
    echo "--- pruning containers ---"
    docker container prune -f;
    echo "--- pruning images ---"
    docker image prune -a -f;
    echo "--- pruning volumes ---"
    docker volume prune -f;
    echo "--- pruning networks ---"
    docker network prune -f;
    echo "--- docker system prune -a --volumes -f ---"
    docker system prune -a --volumes -f;
    echo "--- images ---"
    docker image ls -a;
    echo "--- containers ---"
    docker container ls -a;
    echo "--- volumes ---"
    docker volume ls;
    echo "--- networks ---"
    docker network ls;
}

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
gmi () { go mod init github.com/$GITHUB_USERNAME/$@; }
gmt () { go mod tidy; }
gmd () { go mod download; }
gt () { go test ./... --coverprofile=c.out; }
gtcover () { gt; go tool cover -html c.out; }
gcover () { go tool cover -html c.out; }


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
ssd () { echo `pwd` > ~/.starting_directory; echo "starting directory now set to: "; cat ~/.starting_directory; }
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
