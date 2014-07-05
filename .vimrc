runtime! debian.vim
if has("syntax")
  syntax on
endif

"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

filetype indent plugin on
filetype plugin on
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

set ruler
set showcmd
set nocompatible
set autowrite
inoremap jj <Esc>
inoremap jsop System.out.println(
"set relativenumber

set number
set incsearch
set hlsearch

noremap <F2> <Esc>:e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
noremap <F3> <Esc>:vs %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
noremap <F4> <Esc>:e Makefile<CR>
noremap <F5> <Esc>:vs Makefile<CR>
cnoremap w!! w !sudo tee % >/dev/null
nnoremap <silent> ,/ :let @/ = ""<CR>

