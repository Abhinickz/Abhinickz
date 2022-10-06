set number
set tabstop=4
set ai
set hls
set shiftwidth=4
set softtabstop=4
set nocompatible
set backspace=indent,eol,start
set pastetoggle=<F2>
set encoding=utf-8
noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>

" Turn on color syntax highlighting
syntax on

" sudo please: fix read-only file with this:
cmap w!! w !sudo tee > /dev/null %

" disable vim automatic visual mode on mouse select:
set mouse-=a
