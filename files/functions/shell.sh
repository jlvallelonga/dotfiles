
path_of_this_script () { $(dirname $(realpath $0)); }

# functions to return text that is colored
# red () { echo -e "${RED}$@${NC}"; }
green () { echo -e "${$GREEN}$@${$NC}"; }
yellow () { echo -e "${$YELLOW}$@${$NC}"; }
