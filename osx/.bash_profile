MVN_VERSION=apache-maven-3.3.3
JAVA_VERSION=1.8

export M2_HOME=~/dev/maven/$MVN_VERSION
export M2=$M2_HOME/bin
export PATH=$PATH:$M2
export JAVA_HOME=`/usr/libexec/java_home -v $JAVA_VERSION`

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

pwd_frecency() {
    fasd | grep $PWD$ | awk -F" " '{print $1}'
}

export PS1="\[\033[0;31m\]\D{%F %T}\[\033[0;37m\] \u@\h \[\033[0m\]\W\[\033[36m\]\$(parse_git_branch)\[\033[00m\] (\$(pwd_frecency))\n$ "
source ~/git-completion.bash

# Don't write to history if the command starts with a space, don't write duplicate commands to history, remove duplicate commands from history.
export HISTCONTORL=ignorespace:ignoredups:erasedups
# Make history long
export HISTSIZE=100000
# Make history big
export HISTFILESIZE=2000000
# Put historical command on command-line for editing instead of executing immediately.
shopt -s histverify
# Append to history file when shell exits instead of overwriting
shopt -s histappend

alias hippo-run="mvn -T 1.5C clean install && mvn -T 1.5C -Pcargo.run"
alias git-sync="git checkout develop && git pull --rebase && git rebase develop "


# fasd aliases
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

eval "$(fasd --init auto)"

