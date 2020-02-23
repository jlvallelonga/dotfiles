export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.git-completion.bash
source ~/.dotfiles/aliases.sh
source ~/.dotfiles/functions.sh

# default working directory
nsrc

# allows history between iex sessions
export ERL_AFLAGS="-kernel shell_history enabled"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
