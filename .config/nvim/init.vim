call plug#begin(expand('~/.config/nvim/plugged'))
    Plug 'ryanoasis/vim-devicons'
    Plug 'dracula/vim', { 'as': 'dracula' }

    Plug 'junegunn/fzf'
    Plug 'tpope/vim-commentary'
    Plug 'vim-airline/vim-airline'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'Yggdroot/indentLine'

    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

    Plug 'rizzatti/dash.vim'
call plug#end()

filetype plugin indent on

let mapleader = ','
let g:mapleader = ','

" Ignore compiled files
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,.git\*,.hg\*,.svn\*

set autoindent
set autoread
set backspace=indent,eol,start
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set encoding=utf8
set expandtab
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
set number
set ruler
set shiftround
set shiftwidth=4
set showcmd
set showmatch
set showmode
set si
set smartcase
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set textwidth=79
set tm=500
set wrap

" Neovim 0.4.x
set wildoptions=pum
set winblend=30
set pumblend=40

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

syntax on " enable syntax processing
colorscheme dracula

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType haskell,python autocmd BufWritePre <buffer> %s/\s\+$//e

    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType python setlocal completeopt-=preview
    autocmd FileType python setlocal textwidth=119

    autocmd BufEnter *.cls setlocal filetype=java

    autocmd BufEnter Makefile setlocal noexpandtab

    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2

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

    autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END


nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Nerd Tree
let g:NERDTreeWinPos = 'left'
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeWinSize=35
map <C-n> :NERDTreeToggle<CR>

" coc.nvim
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p :<C-u>CocListResume<CR>

" Airline
let g:airline_theme = 'dracula'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" fzf
let g:fzf_action = {
\   'ctrl-t': 'tab split',
\   'ctrl-x': 'split',
\   'ctrl-v': 'vsplit' }

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Navigating of terminal panel
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
