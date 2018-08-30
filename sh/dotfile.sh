RESET=$(echo -en '\033[0m')
RED=$(echo -en '\033[00;31m')
GREEN=$(echo -en '\033[00;32m')
YELLOW=$(echo -en '\033[00;33m')
BLUE=$(echo -en '\033[00;34m')
MAGENTA=$(echo -en '\033[00;35m')
PURPLE=$(echo -en '\033[00;35m')
CYAN=$(echo -en '\033[00;36m')
LRED=$(echo -en '\033[01;31m')
LGREEN=$(echo -en '\033[01;32m')
LYELLOW=$(echo -en '\033[01;33m')

# Find all files which contain the specified text pattern
findtext(){
  # arg1 = 'pattern'
  grep -rnw '.' -e $1 | while read el; do
    fpath="$(echo $el | cut -d: -f 1)"
    mt="$(echo $el | cut -d: -f 3 | cut -c 1-60)"
    printf "${CYAN}$fpath ${RESET}\n"
    echo -e "\t$mt"
  done
}

# List all filepaths which contain the specified text pattern
findtextf(){
  echo "${CYAN}"
  grep -rnw '.' -e $1 | cut -d: -f 1 | sort -u
  echo "${RESET}"
}

