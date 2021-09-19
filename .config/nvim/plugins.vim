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

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'onsails/lspkind-nvim'
call plug#end()


luafile ~/.config/nvim/lua/plugins/init.lua
