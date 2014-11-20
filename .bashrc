##############################
#  SHORTCUTS
##############################
export OPT=$HOME/opt
export DOWNLOAD=$HOME/Downloads
export APPLICATIONS=/Applications

###################
# PROMPT
#\h:\W \u\$
###################
#export PS1='\W\n\$'
export PS1="[\d \t:\w ]\n\$"

####################
#  MAVEN STUFF
####################
export MAVEN_HOME=/opt/apache-maven-3.0.4
export GRADLE_HOME=/opt/gradle-1.12
export M2_REPO=$HOME/.m2/repository

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_55.jdk/Contents/Home

alias vim='$APPLICATIONS/MacVim.app/Contents/MacOS/Vim -g'

export PATH=.:$JAVA_HOME/bin:$GRADLE_HOME/bin:$MAVEN_HOME/bin:$PATH

export EDITOR=vim

set -o vi

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=Default
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
