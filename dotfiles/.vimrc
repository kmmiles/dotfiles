let g:is_bash = 1
set visualbell
set termguicolors

syntax enable
set laststatus=2
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab
set backspace=2
set modeline
set clipboard=unnamedplus
"set spell spelllang=en_us

"  autocmd vimenter * ++nested colorscheme gruvbox
if has('nvim')
  colorscheme nord
else
  colorscheme elflord
endif

" In ~/.vim/vimrc, or somewhere similar.
let g:ale_linters = {
\   'markdown': [],
\}

" transparent bg
"autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
"autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
"
