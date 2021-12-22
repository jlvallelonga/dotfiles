export PATH=$HOME/bin:/usr/local/bin:$PATH

# krew for kubectl
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# allows history between iex sessions
export ERL_AFLAGS="-kernel shell_history enabled"

source ~/.zshenv_local
