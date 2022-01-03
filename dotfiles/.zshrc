#!/usr/bin/zsh

# zsh options
setopt autocd
unsetopt beep
bindkey -v

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
  "zsh-users/zsh-history-substring-search/zsh-history-substring-search.zsh"
)
for plugin in $plugins; do
  if [[ -f "$HOME/.local/src/$plugin" ]]; then
    source "$HOME/.local/src/$plugin"
  fi
done

################################################################################
# source the generic profile
################################################################################
if [[ -f "$HOME"/.rc-generic ]]; then
  # shellcheck source=/dev/null
  source "$HOME"/.rc-generic
fi

eval "$(starship init zsh)"
