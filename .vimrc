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
autocmd BufReadPost *.jsx setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufReadPost *.txt set tw=80
au BufReadPost *.yml set syntax=sls

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'https://github.com/gmarik/Vundle.vim.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/a.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'saltstack/salt-vim'
Plugin 'vim-scripts/closetag.vim'
Plugin 'wting/rust'
Plugin 'airblade/vim-gitgutter'
Plugin 'maxbrunsfeld/vim-emacs-bindings'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'leafgarland/typescript-vim'
Plugin 'posva/vim-vue'
Bundle "lepture/vim-jinja"
Plugin 'hashivim/vim-terraform'
Plugin 'tpope/vim-commentary'
Plugin 'jeetsukumaran/vim-pythonsense'
Plugin 'altercation/vim-colors-solarized'
Plugin 'neovim/nvim-lspconfig'
Plugin 'skylerberg/coq_nvim'
Plugin 'ms-jpq/coq.artifacts'
Plugin 'neoclide/vim-jsx-improve'

call vundle#end()

" Speed up CtrlP indexing
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/bin/*,
set wildignore+=*/node_modules/*,*/bower_components/*,

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


lua <<EOF
vim.diagnostic.config({
  --virtual_text = false,
})
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
    handlers = {
      ["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = false
        }
      ),
    }
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    },
}

-- coq config
ghost_context = {}
ghost_context[1] = ''
ghost_context[2] = ''

vim.g.coq_settings = {
  auto_start = 'shut-up',
  keymap = {
    pre_select = false,
  },
  clients = {
    tmux = {
      enabled = false,
    },
  },
  display = {
    preview = {
      enabled = false,
    },
    ghost_text = {
      enabled = true,
      context = ghost_context,
    },
    icons = {
      mode = 'none',
    },
  },
}
EOF
