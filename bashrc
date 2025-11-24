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

if [ "$TERM" = "linux" ]; then
  echo -en "\e]P03B4252"
  echo -en "\e]P1CF817A"
  echo -en "\e]P2A3BE8C"
  echo -en "\e]P3EBCB8B"
  echo -en "\e]P491B1D1"
  echo -en "\e]P5B48EAD"
  echo -en "\e]P698D0E0"
  echo -en "\e]P7E5E9F0"
  echo -en "\e]P84C566A"
  echo -en "\e]P9CF817A"
  echo -en "\e]PAA3BE8C"
  echo -en "\e]PBEBCB8B"
  echo -en "\e]PC91B1D1"
  echo -en "\e]PDB48EAD"
  echo -en "\e]PE9FCCCB"
  echo -en "\e]PFECEFF4"
  clear
  tmux attach -t "(●'◡'●)" || tmux -f $HOME/nomad/tmux.conf new -s "(●'◡'●)"
fi
