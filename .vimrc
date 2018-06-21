" Tebesfinwo Default Configuration
" TODO(jooi): Remove stuffs which I do not understand / rarely use.

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Ignore compiled files
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn

if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set background=dark
set showmode 
set showmatch
set showcmd

"Always show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
set matchtime=2
set matchpairs+=<:> 

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Always show the status line
set laststatus=2

" Colors and Fonts
syntax on " enable syntax processing 
colorscheme solarized

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupcopy=yes " Not to interfere the recompilation.
set writebackup

" Text, tab and indent related
set backspace=indent,eol,start
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
set textwidth=79 " lines longer than 79 columns will be broken 
set shiftwidth=4 " operation >> indents 4 columns; << unindents 4 columns
set shiftround " round indent to multiple of 'shiftwidth' 
set autoindent " align the new line indent with the previous line
set nowrap " Disable auto-wrapping
set ai "Auto indent
set si "Smart indent
set colorcolumn=80 " Line length marker

set number " show line number

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
    autocmd FileType python setlocal textwidth=99
    autocmd FileType python setlocal colorcolumn=99
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType python setlocal completeopt-=preview
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    " Enable spellchecking for Markdown
    autocmd FileType markdown setlocal spell
    " Automatically wrap at 80 characters for Markdown
    autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Nerd Tree
let g:NERDTreeWinPos = "left"
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

" Ctrl-P
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" Syntastic
set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_python_exec = 'python'
let g:syntastic_python_pylint_exe = 'python -m pylint'
" let g:rustfmt_autosave = 1

let python_highlight_all = 1

" Deoplete for NeoVim
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>": "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() > "\<C-p>": "\<S-Tab>"
