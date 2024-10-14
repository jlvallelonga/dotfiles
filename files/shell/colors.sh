
# colors
NC='\033[0m' # No Color
# NORMAL="\033[0;39m"

BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
PINK="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"

# functions to return text that is colored
black () { printf "$BLACK$@$NC"; }
red () { printf "$RED$@$NC"; }
green () { printf "$GREEN$@$NC"; }
yellow () { printf "$YELLOW$@$NC"; }
blue () { printf "$BLUE$@$NC"; }
pink () { printf "$PINK$@$NC"; }
cyan () { printf "$CYAN$@$NC"; }
white () { printf "$WHITE$@$NC"; }
