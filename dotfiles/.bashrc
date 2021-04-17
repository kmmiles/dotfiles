# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# shell options
set bell-style none
shopt -s checkwinsize
shopt -s histappend

# history file settings
HISTCONTROL=ignoredups:erasedups  # no duplicate entries
HISTSIZE=100000                   # many commands in ongoing session memory
HISTFILESIZE=100000               # many lines in .bash_history

# editor settings
GIT_EDITOR=nvim
VISUAL=nvim
EDITOR=nvim
export GIT_EDITOR VISUAL EDITOR

# prompt
return_code() {
  rc=$?
  text_bold=$(tput bold)
  text_red=$(tput setaf 1)
  text_green=$(tput setaf 2)
  text_normal=$(tput sgr0)
  if [[ ${rc} -eq 0 ]]; then
    printf "%s" "${text_bold}${text_green}${rc}${text_normal}"
  else
    printf "%s" "${text_bold}${text_red}${rc}${text_normal}"
  fi
}
PS1='\[\e[33m\]\w\[\e[0m\] [`return_code`]\n\$ '
export -f return_code
export PS1

# PATH's
ponybin=$HOME/.local/share/ponyup/bin
flutterbin=$HOME/.local/src/flutter/bin
emacsbin=~/.emacs.d/bin
PATH="$HOME/.local/bin:$emacsbin:$flutterbin:$ponybin:$PATH"
GOPATH=$HOME/go
export PATH GOPATH

# aliases
has() { type "$1" &> /dev/null ; } 
has exa         &&  alias ls='exa --git'
has prettyping  &&  alias ping='prettyping --nolegend'
has btm         &&  alias btm='btm --battery --color gruvbox'
has fnm         &&  alias nvm='fnm'
has nvim        &&  alias vim='nvim'
has python3     &&  alias httpd='python3 -m http.server'
has dpkg        &&  alias apt-provides='dpkg -S'
has less        &&  alias less='less -R'

# less colors
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# dircolors
if [[ -x /usr/bin/dircolors ]]; then
  if [[ -f "$HOME"/.dir_colors ]]; then
    eval "$(dircolors -b "$HOME"/.dir_colors)" 
  else
    eval "$(dircolors -b)"
  fi
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# x11 for wsl2
if has wslpath; then
  DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2; exit;}'):0.0
  export DISPLAY
fi

# fnm 
has fnm && eval "$(fnm env)"
