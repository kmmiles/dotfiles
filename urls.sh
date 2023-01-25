# every url used in `install`
declare -A urls
urls[dotfiles]="https://github.com/kmmiles/dotfiles.git"
urls[zsh-syntax-highlighting]="https://github.com/zsh-users/zsh-syntax-highlighting"
urls[zsh-autosuggestions]="https://github.com/zsh-users/zsh-autosuggestions"
urls[zsh-history-substring-search]="https://github.com/zsh-users/zsh-history-substring-search"
urls[zsh-completions]="https://github.com/zsh-users/zsh-completions"
urls[nord-dircolors]="https://github.com/arcticicestudio/nord-dircolors"
urls[nord-tmux]="https://github.com/arcticicestudio/nord-tmux"
urls[nord-vim]="https://github.com/arcticicestudio/nord-vim"
urls[odin]="https://github.com/Tetralux/odin.vim"
urls[ale]="https://github.com/dense-analysis/ale.git"
urls[vim-go]="git clone https://github.com/fatih/vim-go.git"

# most/all of these should be installed system wide using your package manager.
# but if `install -e` is invoked, and the binary is not located in $PATH,
# it will be download and installed to `~/.local`.
#urls[nvim]="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz"
urls[nvim]="https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz"
urls[prettyping]="https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping"
urls[exa]="https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip"
urls[glow]="https://github.com/charmbracelet/glow/releases/download/v1.0.2/glow_1.0.2_linux_x86_64.tar.gz"
urls[youtube-dl]="https://yt-dl.org/downloads/latest/youtube-dl"
urls[yq]="https://github.com/mikefarah/yq/releases/download/v4.6.1/yq_linux_amd64.tar.gz"
urls[fnm]="https://github.com/Schniz/fnm/releases/download/v1.23.0/fnm-linux.zip"
