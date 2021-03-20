call plug#begin(expand('~/.config/nvim/plugged'))
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
    Plug 'junegunn/fzf.vim'
    Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
    Plug 'psliwka/vim-smoothie'
    Plug 'rizzatti/dash.vim'
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'tpope/vim-commentary'
    Plug 'vim-airline/vim-airline'
    Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-fugitive'
    Plug 'luochen1990/rainbow'

    Plug 'neovim/nvim-lspconfig'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/deoplete-lsp'
call plug#end()

filetype plugin indent on

" Python configuration needed by plugins
let g:loaded_python_provider = 0
let g:python3_host_prog = expand('~/.pyenv/versions/py3nvim/bin/python')

luafile ~/.config/nvim/lua/plugins/init.lua

if exists('+signcolumn')
  setlocal signcolumn=yes
endif

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#manual_complete()
