export NOMAD=${NOMAD:-$(readlink -f $(dirname -- "${BASH_SOURCE[0]}"))}
echo NOMAD=$NOMAD
export HOME=$NOMAD

export PS1='\[\033[0;32m\]ayuusweetfish\[\033[m\]:\[\033[34m\]\W\[\033[m\]\[\033[33m\]♪\[\033[m\] '

HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
HISTFILE=$NOMAD/bash_history
HISTSIZE=1000000
HISTFILESIZE=200000000
HISTFORMAT="%F %T "

alias vim="vim -u $NOMAD/vimrc"
