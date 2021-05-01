set nocompatible
filetype off
autocmd Bufread,BufNewFile *.feature set filetype=gherkin
autocmd Bufread,BufNewFile *.raml set filetype=yaml
autocmd Bufread,BufNewFile *.svg set filetype=xml
autocmd Bufread,BufNewFile *.md set filetype=markdown
autocmd Filetype xml setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 foldmethod=indent
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype eruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype bib setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype typescript setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype c setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufReadPost *.cs setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype gherkin setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype jinja setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal spell expandtab tabstop=3 shiftwidth=3 textwidth=80
autocmd Filetype vue setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype json setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype css setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype scss setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufReadPost *.dot setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufReadPost *.txt set tw=80
au BufReadPost *.yml set syntax=sls

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'git://github.com/gmarik/Vundle.vim.git'
Plugin 'git://github.com/SirVer/ultisnips.git'
Plugin 'git://github.com/skylerberg/vim-snippets.git'
Plugin 'git://github.com/tpope/vim-surround.git'
Plugin 'git://github.com/tpope/vim-repeat.git'
Plugin 'git://github.com/vim-scripts/matchit.zip.git'
Plugin 'git://github.com/vim-scripts/a.vim.git'
Plugin 'git://github.com/scrooloose/syntastic.git'
Plugin 'git://github.com/Lokaltog/vim-easymotion.git'
Plugin 'git://github.com/tpope/vim-fugitive.git'
Plugin 'git://github.com/christoomey/vim-tmux-navigator.git'
Plugin 'git://github.com/saltstack/salt-vim.git'
Plugin 'git://github.com/kien/ctrlp.vim.git'
Plugin 'git://github.com/vim-scripts/closetag.vim.git'
Plugin 'git://github.com/wting/rust.vim'
Plugin 'git://github.com/Valloric/YouCompleteMe.git'
Plugin 'git://github.com/tpope/vim-cucumber.git'
Plugin 'git://github.com/airblade/vim-gitgutter.git'
Plugin 'git://github.com/maxbrunsfeld/vim-emacs-bindings.git'
Plugin 'git://github.com/hynek/vim-python-pep8-indent.git'
"Plugin 'git://github.com/ludovicchabant/vim-gutentags.git'
Plugin 'leafgarland/typescript-vim'
Plugin 'posva/vim-vue'
Bundle "lepture/vim-jinja"
Bundle 'ervandew/supertab'
Plugin 'hashivim/vim-terraform'
Plugin 'numirias/semshi'
Plugin 'tpope/vim-commentary'
Plugin 'jeetsukumaran/vim-pythonsense'
Plugin 'altercation/vim-colors-solarized'


call vundle#end()

filetype plugin indent on
syntax on


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
noremap <F2> :YcmCompleter FixIt<CR>

let g:SuperTabDefaultCompletionType = '<C-n>'


"let g:gutentags_ctags_extra_args = ['--fields=+l']

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["custom", "UltiSnips"]

" Syntax checkers
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_vue_checkers = []
let g:syntastic_python_pylint_args = '--load-plugins pylint_django'
let g:syntastic_python_pylint_args = '--rcfile=/home/skyler/.pylintrc'
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_eslint_exe = 'npx eslint'

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" Speed up CtrlP indexing
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/bin/*,
set wildignore+=*/node_modules/*,*/bower_components/*,

" Ropevim settings
let g:ropevim_autoimport_modules = ["os", "shutil"]

set smarttab
set number
set ruler
set showcmd
set incsearch
set hlsearch
set smartcase
set splitbelow
set splitright
set lazyredraw
set hidden
set history=1000
set backspace=2
set ttimeoutlen=100
set notimeout
set autowrite
set scrolloff=5
set mouse=""
set nojoinspaces
set foldlevelstart=99

let mapleader = ","
inoremap jj <Esc>
cnoremap w!! w !sudo tee % >/dev/null
cnoremap hex %!xxd<CR>
cnoremap nohex %!xxd -r<CR>
nnoremap <silent> ,/ :let @/ = ""<CR>
nnoremap <C-N> :n<CR>
nnoremap Y y$
nnoremap <Space> <Nop>
nnoremap <Space> za

nnoremap "* "+
vnoremap "* "+
xnoremap "* "+
snoremap "* "+
cnoremap "* "+
onoremap "* "+

" Save with CTRL-S
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>


" Semshi settings
function CustomHighlights()
    hi semshiImported        ctermfg=214 guifg=#ffaf00
endfunction
autocmd FileType python call CustomHighlights()
autocmd ColorScheme * call CustomHighlights()

"let g:semshi#excluded_hl_groups = []

nmap <silent> <Tab> :Semshi goto name next<CR>
nmap <silent> <S-Tab> :Semshi goto name prev<CR>
nmap <silent> <Leader>rr :Semshi rename<CR>

nmap <silent> <Leader>gu :Semshi goto unresolved first<CR>
nmap <silent> <Leader>gp :Semshi goto parameterUnused first<CR>


function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

set background=dark
colorscheme solarized
