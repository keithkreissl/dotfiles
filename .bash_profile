export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home

export MAVEN_HOME=/Applications/apache-maven-3.2.3

export PATH=$MAVEN_HOME/bin:$PATH
#export PATH=$JAVA_HOME/bin:$PATH
export PATH=~/bin:$PATH
export PATH=.:$PATH

export SITES=/Applications/Oracle/WebCenter/Sites/11gR1/Sites/11.1.1.8.0

set -o vi


export EDITOR=vim
export DISPLAY=:0

export NGINX_HOME=/usr/local/etc/nginx

export GOPATH=~/Documents/development
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOROOT/bin

export LOCALBIN=~/bin

export PATH=$LOCALBIN:$PATH

export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOPATH/bin

export PATH="$HOME/.jenv/bin:$PATH":$PATH

eval "$(jenv init -)"

alias mvn="jenv exec mvn"


if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
    __git_complete 'git freebase' _git_rebase
fi

if [ -f ~/gradle-tab-completion.bash ]; then
    source ~/gradle-tab-completion.bash
fi  

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).


# begin bitcar
export BITCAR_WORKSPACE_DIR="/Users/keithkreissl/Documents/development/src"
export BITCAR_EDITOR_CMD="vim"
source $HOME/.bitcar/cli.sh
source $HOME/.bitcar/completions.sh
# end bitcarexport PATH="/usr/local/opt/apache-spark@1.6/bin:$PATH"
