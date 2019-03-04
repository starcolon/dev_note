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


POWERLEVEL9K_MODE='nerdfont-complete'
source  ~/powerlevel9k/powerlevel9k.zsh-theme

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export EDITOR=/usr/local/bin/subl3
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

gitlog(){
	git log --oneline --deco --all "$@";
}
gitlogs(){
	git log --oneline --deco --all --simplify-by-decoration "$@";
}
dir(){
	tree -d -L "$@";
}
ll(){
	ls -lFG "$@";
}
setbashtitle(){
  echo -n -e "\033]0;$@\007"
}
title(){
  print -Pn "\e]1;$1\a"
}
alias rb="/usr/local/bin/ruby"
alias cabal="/usr/local/bin/cabal"
alias brainfuck="/Users/pataoengineer/Sites/3rdParty/brainfuck/build/brainfuck"
alias julia="/Applications/Julia-0.5.app/Contents/Resources/julia/bin/julia"
alias runmongo="/usr/local/opt/mongodb@3.0/bin/mongod --dbpath /usr/local/var/mongodb"

# Home of lovely Scala
export SCALA_HOME=/usr/local/scala

# Make Java house a home
export JAVA_HOME=$(/usr/libexec/java_home)

# EC2 home
export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.3.2

# SOLR
export SOLR=/usr/local/solr/solr-5.3.1
export SOLRCOLLECTION=/usr/local/solr/solr-5.3.1/server/solr

# Apache Spark / Hadoop
export SPARK_HOME=/opt/spark-2.2.1-bin-hadoop2.7/
export PYSPARK_PYTHON=/Library/Frameworks/Python.framework/Versions/3.4/bin/python3

export HADOOP_HOME=/usr/local/Cellar/hadoop/2.7.2/
export HIVE_HOME=/usr/local/Cellar/hive/2.0.1/
export SBT_OPTS="-Xms512M -Xmx1024M -Xss2M -XX:MaxMetaspaceSize=1024M"

# NEO4J HOME
export NEO4J=/usr/bin/neo4j-community-2.2.0/bin

# ORIENTDB HOME
export ORIENTDB=/opt/orientdb-community-2.1.16

# OPENCV 
export OPENCV_DIR=/usr/local/opt/opencv3/
export OpenCV_DIR=$OPENCV_DIR
export OpenCV_ROOT_DIR=$OPENCV_DIR
export OPENCV_INCLUDE_DIR=$OPENCV_DIR/include
export OpenCV_INCLUDE_DIR=$OPENCV_DIR/include
export OpenCV_LIBRARIES=$OPENCV_DIR/lib
export DYLD_LIBRARY_PATH=DYLD_LIBRARY_PATH:$OpenCV_LIBRARIES

export PATH
export PATH=/Library/Frameworks/Python.framework/Versions/3.4/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/pataoengineer/.rvm/bin

export PATH=$PATH:$EC2_HOME/bin:$SCALA_HOME/bin
export PATH=$PATH:/usr/local/sbin

# Add GHC 7.8.4 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/Haskell-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

start_mongo3(){
  /usr/local/opt/mongodb@3.0/bin/mongod --dbpath /usr/local/var/mongodb
}



