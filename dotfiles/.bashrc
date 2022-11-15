#!/bin/bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# bash options
set bell-style none
shopt -s checkwinsize
shopt -s histappend

# bash prompt
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

################################################################################
# source the generic profile
################################################################################
if [[ -f "$HOME"/.rc-generic ]]; then
  # shellcheck source=/dev/null
  source "$HOME"/.rc-generic
fi

# init starship if it's installed
#if command -v "starship" > /dev/null 2>&1; then
#  eval "$(starship init bash)"
#fi
