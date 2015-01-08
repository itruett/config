MVN_VERSION=apache-maven-3.2.3
JAVA_VERSION=1.7

export M2_HOME=~/dev/maven/$MVN_VERSION
export M2=$M2_HOME/bin
export PATH=$PATH:$M2
export JAVA_HOME=`/usr/libexec/java_home -v $JAVA_VERSION`

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PS1="\[\033[0;31m\]\D{%F %T}\[\033[1;37m\] \u@\h \[\033[0m\]\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]\n$ "
source ~/git-completion.bash

