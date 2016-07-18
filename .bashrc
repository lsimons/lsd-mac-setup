### BASH config
export CLICOLOR=yes
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export HISTFILESIZE=
export HISTSIZE=

eval "$(direnv hook bash)"

### PS1
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

if [ $(id -u) -eq 0 ]; then
  export PS1='\[\033[00;31m\]\u\[\033[00;32m\]@\h\[\033[00;37m\]:\[\033[01;34m\]\w\[\033[00;35m\]$(__git_ps1 " (%s)")\n\[\033[00;31m\]# \[\033[00m\]'
else
  export PS1='\[\033[00;32m\]\u@\h\[\033[00;37m\]:\[\033[01;34m\]\w\[\033[00;35m\]$(__git_ps1 " (%s)")\n\[\033[00;37m\]$ \[\033[00m\]'
fi
# export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'

### dev tools
export PYENV_ROOT=/usr/local/opt/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

export JENV_ROOT=/usr/local/opt/jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

export MAVEN_OPTS="-Xmx1024m"
# -Xdebug -Xrunjdwp:transport=dt_socket,address=8787,server=y,suspend=n"

export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
export PERL5LIB=/Users/lsimons/perl5/lib/perl5

### editor
alias mate=atom
alias subl=atom
export EDITOR="/usr/local/bin/atom --wait"
export SVN_EDITOR="/usr/local/bin/atom -wait"

### autocompletion
if [ -f ~/.ssh/known_hosts ]; then
  complete -W "$(echo $(cat ~/.ssh/known_hosts | \
    cut -f 1 -d ' ' | sed -e s/,.*//g | \
    sort -u | grep -v "\["))" ssh
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

### local tweaks
[[ -f ~/.localrc ]] && source ~/.localrc
