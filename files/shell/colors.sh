
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
black () { echo -e "$BLACK$@$NC"; }
red () { echo -e "$RED$@$NC"; }
green () { echo -e "$GREEN$@$NC"; }
yellow () { echo -e "$YELLOW$@$NC"; }
blue () { echo -e "$BLUE$@$NC"; }
pink () { echo -e "$PINK$@$NC"; }
cyan () { echo -e "$CYAN$@$NC"; }
white () { echo -e "$WHITE$@$NC"; }
