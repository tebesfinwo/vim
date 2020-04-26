" ================ PLUGIN SETUP ============== {{{
execute 'source' fnameescape(expand('~/.config/nvim/plugins.vim'))
" }}}


" ================ MAPPINGS ================== {{{
let mapleader = ','
let g:mapleader = ','

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" }}}

" ================ SEARCH ==================== {{{
set hlsearch
set ignorecase
set incsearch
set smartcase
" }}}
" ================ General =================== {{{ set autoindent
set autoread
set backspace=indent,eol,start
set conceallevel=0
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set encoding=utf8
set expandtab
set history=700
set magic
set matchpairs+=<:>
set matchtime=2
set noerrorbells
set novisualbell
set shiftround
set shiftwidth=4
set showmatch
set smartindent
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set textwidth=79
set timeoutlen=500
set wrap

set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,.git\*,.hg\*,.svn\*
" }}}


" ================ UI ======================== {{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set wildoptions=pum
set number
set ruler

syntax on
colorscheme dracula
" }}}

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType haskell,python autocmd BufWritePre <buffer> %s/\s\+$//e

    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType python setlocal completeopt-=preview
    autocmd FileType python setlocal textwidth=119

    autocmd BufEnter Makefile setlocal noexpandtab

    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2

    autocmd BufEnter *.js setlocal tabstop=2
    autocmd BufEnter *.js setlocal shiftwidth=2
    autocmd BufEnter *.js setlocal softtabstop=2

    autocmd BufEnter *.yaml setlocal tabstop=2
    autocmd BufEnter *.yaml setlocal shiftwidth=2
    autocmd BufEnter *.yaml setlocal softtabstop=2

    autocmd FileType haskell setlocal tabstop=2
    autocmd FileType haskell setlocal shiftwidth=2
    autocmd FileType haskell setlocal softtabstop=2

    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown setlocal tabstop=2
    autocmd FileType markdown setlocal shiftwidth=2
    autocmd FileType markdown setlocal softtabstop=2
    autocmd BufRead,BufNewFile *.md setlocal textwidth=80

    autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

