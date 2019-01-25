call plug#begin(expand('~/.config/nvim/plugged'))
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'sheerun/vim-polyglot'

    Plug 'junegunn/fzf'
    Plug 'tpope/vim-commentary'
    Plug 'vim-airline/vim-airline'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'parsonsmatt/intero-neovim'
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    Plug 'zchee/deoplete-jedi'
call plug#end()

filetype plugin indent on

let mapleader = ','
let g:mapleader = ','

" Ignore compiled files
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn

if has('win16') || has('win32')
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set autoread
set background=dark
set encoding=utf8
set history=700
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set magic
set mat=2
set matchpairs+=<:>
set matchtime=2
set noerrorbells
set novisualbell
set ruler
set showcmd
set showmatch
set showmode
set smartcase
set tm=500
set t_vb=

if (empty($TMUX))
  if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

  if (has('termguicolors'))
    set termguicolors
  endif
endif

syntax on " enable syntax processing
color dracula

set backup
set backupcopy=yes " Not to interfere the recompilation.
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set autoindent
set backspace=indent,eol,start
set expandtab
set number
set shiftround
set shiftwidth=4
set si
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set textwidth=79
set wrap

let python_highlight_all = 1

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType c,cpp,python,php autocmd BufWritePre <buffer> %s/\s\+$//e

    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4

    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4

    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s

    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType python setlocal completeopt-=preview
    autocmd FileType python setlocal textwidth=119

    autocmd BufEnter *.cls setlocal filetype=java

    autocmd BufEnter *.zsh-theme setlocal filetype=zsh

    autocmd BufEnter Makefile setlocal noexpandtab

    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2

    autocmd BufEnter *.hy setlocal tabstop=2
    autocmd BufEnter *.hy setlocal shiftwidth=2
    autocmd BufEnter *.hy setlocal softtabstop=2

    autocmd BufEnter *.js setlocal tabstop=2
    autocmd BufEnter *.js setlocal shiftwidth=2
    autocmd BufEnter *.js setlocal softtabstop=2

    autocmd BufEnter *.ml setlocal tabstop=2
    autocmd BufEnter *.ml setlocal shiftwidth=2
    autocmd BufEnter *.ml setlocal softtabstop=2

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
augroup END


nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" One dark theme
let g:onedark_termcolors=256

" Nerd Tree
let g:NERDTreeWinPos = 'left'
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeWinSize=35
map <C-n> :NERDTreeToggle<CR>

" Deoplete for NeoVim
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.ocaml = '[.\w]+'
let g:deoplete#omni#input_patterns.reason = '[.\w]+'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Language client server
let g:LanguageClient_serverCommands = {
\   'sh': ['bash-language-server', 'start'],
\   'haskell': ['hie-wrapper'],
\   'python': ['pyls']
\}
map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

" Airline
let g:airline_theme = 'dracula'

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Intero
let g:intero_start_immediately = 0
let g:intero_type_on_hover = 1
let g:intero_window_size = 15

" Navigating of terminal panel
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

let g:intero_initialized = 0
function! s:reload_intero_if_done()
    if g:intero_initialized
        call intero#repl#reload()
    endif
endfunction

augroup interogroup
    au!
    au BufWritePost *.hs call s:reload_intero_if_done()
    au FileType haskell nmap <silent> <leader>t <Plug>InteroGenericType
    au FileType haskell nmap <silent> <leader>T <Plug>InteroType
    au FileType haskell nnoremap <silent> <leader>ni :InteroTypeInsert<CR>
    au FileType haskell nnoremap <silent> <leader>i :InteroInfo<CR>
    au FileType haskell nnoremap <silent> <leader>nn :InteroOpen<CR>
    au FileType haskell nnoremap <silent> <leader>nh :InteroHide<CR>
    au FileType haskell nnoremap <silent> <leader>nf :InteroLoadCurrentFile<CR>
    au FileType haskell nnoremap <silent> <leader>ng :InteroGoToDef<CR>
    au FileType haskell nnoremap <silent> <leader>ne :InteroEval<CR>
    au FileType haskell nnoremap <silent> <leader>ns :InteroStart<CR>
    au FileType haskell nnoremap <silent> <leader>nk :InteroKill<CR>
    au FileType haskell nnoremap <silent> <leader>nr :InteroKill<CR> :InteroOpen<CR>
    au FileType haskell nnoremap <leader>nt :InteroSetTargets<CR>
augroup END
