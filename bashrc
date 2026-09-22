FULLY_PORTABLE=false

if $FULLY_PORTABLE; then
  export NOMAD=${NOMAD:-$(dirname -- $(readlink -f "${BASH_SOURCE[0]}"))}
  echo NOMAD=$NOMAD
  export HOME=$NOMAD
else
  export NOMAD=~/nomad
fi

if [[ $- == *i* ]]; then export LC_ALL=C.UTF-8; fi
export EDITOR=vim
export PS1='\[\033[0;32m\]\u\[\033[m\]:\[\033[34m\]\W\[\033[m\]\[\033[33m\]♪\[\033[m\] '

HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
if $FULLY_PORTABLE; then
  HISTFILE=$NOMAD/bash_history
fi
HISTSIZE=1000000
HISTFILESIZE=200000000
HISTTIMEFORMAT="%F %T "

export VIMINIT="source $NOMAD/vimrc"
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
  sudo loadkeys <<EOF
control keycode 2 = F101
string F101 = "\0021"
control keycode 3 = F102
string F102 = "\0022"
control keycode 4 = F103
string F103 = "\0023"
control keycode 5 = F104
string F104 = "\0024"
control keycode 6 = F105
string F105 = "\0025"
control keycode 7 = F106
string F106 = "\0026"
control keycode 8 = F107
string F107 = "\0027"
control keycode 9 = F108
string F108 = "\0028"
control keycode 10 = F109
string F109 = "\0029"
control keycode 11 = F100
string F100 = "\0020"

alt keycode 103 = F110
string F110 = "\033[1;3A"
alt keycode 108 = F111
string F111 = "\033[1;3B"
alt keycode 106 = F112
string F112 = "\033[1;3C"
alt keycode 105 = F113
string F113 = "\033[1;3D"
control shift keycode 103 = F114
string F114 = "\002\033[1;5A"
control shift keycode 108 = F115
string F115 = "\002\033[1;5B"
control shift keycode 106 = F116
string F116 = "\002\033[1;5C"
control shift keycode 105 = F117
string F117 = "\002\033[1;5D"
EOF
  read scr_w scr_h <<< $(fbset -i -fb $(con2fbmap $(fgconsole) | perl -ne 'if (/framebuffer (\d+)/) { print "/dev/fb$1" }') | perl -ne 'if (/mode "(\d+)x(\d+)"/) { print "$1 $2\n" }')
  if [ "$scr_h" -gt 500 ]; then
    setfont $NOMAD/Terminus16.psf -d
  else
    setfont $NOMAD/Terminus16.psf -h17
  fi
  clear
fi

if [ "$TERM" = "linux" ] || [ -n "$ATTACH_TMUX" ]; then
  unset ATTACH_TMUX
  while true; do
    tmux attach -t "(●'◡'●)" || tmux -f $NOMAD/tmux.conf new -s "(●'◡'●)"
    if [ $? -eq 0 ]; then
      tmux has-session -t "(●'◡'●)" && break
      [ "$TERM" = "linux" ] || exit
    fi
    sleep 0.02
  done
fi

if ! shopt -oq posix && [ -e /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi
