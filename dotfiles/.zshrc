#!/usr/bin/zsh

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

# override history settings for zsh
HISTFILE=~/.zsh_history
HISTCONTROL=ignoredups:erasedups
HISTSIZE=100000
HISTFILESIZE=100000
SAVEHIST=100000
export HISTFILE HISTCONTROL HISTSIZE HISTFILESIZE SAVEHIST
setopt appendhistory

# init starship if it's installed
if command -v "starship" > /dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# bun completions
[ -s "/home/kmmiles/.bun/_bun" ] && source "/home/kmmiles/.bun/_bun"

# Bun
export BUN_INSTALL="/home/kmmiles/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
. "/home/kmmiles/.wasmedge/env"

help() {
  if ! command -v "bash" > /dev/null 2>&1; then
    printf 'Bash not available. Ouch.\n'
    return 1
  fi

  printf 'Using bash help\n'
  bash -c "help $@"
}

# use `bash` help
