syntax enable
set termguicolors
set laststatus=2
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab
set backspace=2
set modeline
let g:is_bash = 1

if has('nvim')
  "autocmd vimenter * ++nested colorscheme gruvbox
  colorscheme nord
else
  colorscheme elflord
endif

" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
