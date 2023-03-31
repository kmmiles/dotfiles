#!/usr/bin/zsh
#
#
help() { bash -c "help $*" ; } 

# zsh options
setopt autocd
setopt NO_nomatch # failed globs behave like bash (silently ignore)
unsetopt beep
bindkey -v

# like bash edit current command in editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# zsh autocompletion
if [[ -d "$HOME"/.local/src/zsh-completions/src ]]; then
  fpath=("$HOME"/.local/src/zsh-completions/src $fpath)
fi
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit

# zsh prompt
PROMPT='%B%F{240}%1~%f%b [%(?.%F{green}√.%F{red}%?)%f] $ '

# zsh plugins
plugins=(
  "zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  "zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh"
)
for plugin in $plugins; do
  plugin_path="$HOME/.local/src/$plugin"
  if [[ -f "$plugin_path" ]]; then source "$plugin_path"; fi
done

################################################################################
# source the generic profile
################################################################################
if [[ -f "$HOME"/.rc-generic ]]; then
  # shellcheck source=/dev/null
  source "$HOME"/.rc-generic
fi

# override history settings for zsh
HISTFILE=~/.zsh_history
export HISTFILE 
setopt appendhistory

# init starship if it's installed
if command -v "starship" > /dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

#if [[ -f "$HOME"/.rc-alias ]]; then
#  source "$HOME"/.rc-alias
