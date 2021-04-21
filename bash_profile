# source from ~/.bashrc if there is one
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

# custom prompt
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function get_time {
  date '+%H:%M'
}
export PS1="\[\033[36;5m\]\$(get_time):\W \[\033[32;5m\]\$(parse_git_branch)\[\033[36;5m\] \u\\$ \[\033[0m\]"
