# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/justinvallelonga/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="amuse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

# misc
alias la='ls -lah'
# output my ip address
alias ip='ifconfig en0 | grep "inet " | cut -d\  -f2'
# remove any rogue swap files
alias killswaps='find . -iname "*.sw[p|n|m]" | xargs rm'

# navigation
nsrc () { cd ~/src/; }
nssh () { cd ~/.ssh/; }
ndown () { cd ~/Downloads; }
ndesk () { cd ~/Desktop; }
nca () { nsrc; cd chalk_api/; }

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

# docker
alias dco="docker-compose"
dcoub () { docker-compose up --build; }
dre () { kbp; docker-compose down; docker-compose up --build; }
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
# "d" for database (like the project's database)
alias psqld='psql chalk_api_dev'

# jekyll
bejs () { bundle exec jekyll serve; }

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

# singularity
rdb () { npx knex-migrate down --to=0; npx knex migrate:latest; dropdb everycampus_test_1; dropdb everycampus_test_2; dropdb everycampus_test_3; dropdb everycampus_test_4; dropdb everycampus_test_5; dropdb everycampus_test_6; dropdb everycampus_test_7; }
dcora () { dco run api $@; }
dbash () { dcora bash; }
dyc () { dcora yarn console; }
dyt () { dco run -e NODE_ENV=test api yarn jest $@; }
dytd () { dco run -e NODE_ENV=test api node --inspect=0.0.0.0:9229 --no-lazy node_modules/.bin/jest --runInBand $@; }
boomboom () { dcod -v; dcob; }
boomtown () { dcod -v; dcob; dco run api yarn migrations; dcou; }

# default working directory
cd ~/src

# asdf version manager
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
