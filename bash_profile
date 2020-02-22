# source from ~/.bashrc if exists
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

source ~/.git-completion.bash

# export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# export PATH="$HOME/.node/bin:$PATH"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# custom prompt
function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function get_time {
  date '+%H:%M'
}
export PS1="\[\033[36;5m\]\$(get_time):\W \[\033[32;5m\]\$(parse_git_branch)\[\033[36;5m\] \u\\$ \[\033[0m\]"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
