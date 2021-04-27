call plug#begin(expand('~/.config/nvim/plugged'))
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

    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'

    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'onsails/lspkind-nvim'
call plug#end()

filetype plugin indent on

" Python configuration needed by plugins
let g:loaded_python_provider = 0
let g:python3_host_prog = expand('~/.pyenv/versions/py3nvim/bin/python')

luafile ~/.config/nvim/lua/plugins/init.lua

if exists('+signcolumn')
  setlocal signcolumn=yes
endif
