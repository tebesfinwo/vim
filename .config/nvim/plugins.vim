call plug#begin(expand('~/.config/nvim/plugged'))
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'junegunn/fzf'
    Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
    Plug 'psliwka/vim-smoothie'
    Plug 'rizzatti/dash.vim'
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'tpope/vim-commentary'
    Plug 'vim-airline/vim-airline'
    Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-fugitive'

    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'nvim-lua/diagnostic-nvim'
call plug#end()

filetype plugin indent on

" Python configuration needed by plugins
let g:loaded_python_provider = 0
let g:python3_host_prog = expand('~/.pyenv/versions/py3nvim/bin/python')

" Nerd Tree
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize=35
map <C-n> :NERDTreeToggle<CR>


" Airline
let g:airline_theme = 'dracula'

" fzf
let g:fzf_action = {
\   'ctrl-t': 'tab split',
\   'ctrl-x': 'split',
\   'ctrl-v': 'vsplit' }


" vim-smoothie
let g:smoothie_no_default_mappings = v:true
nmap <C-d> <Plug>(SmoothieDownwards)
nmap <C-e> <Plug>(SmoothieUpwards)


" Tmux navigator
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Speed up showing diagnostic floating window
set updatetime=1000

" completion-nvim
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

nmap <tab> <Plug>(completion_smart_tab)
nmap <s-tab> <Plug>(completion_smart_s_tab)

" nvim-lsp
lua << END
  local on_attach_vim = function(client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
  end

  require'nvim_lsp'.bashls.setup{on_attach=on_attach_vim}
  require'nvim_lsp'.hie.setup{on_attach=on_attach_vim}
  require'nvim_lsp'.jsonls.setup{on_attach=on_attach_vim}
  require'nvim_lsp'.metals.setup{on_attach=on_attach_vim}
  require'nvim_lsp'.pyls.setup{on_attach=on_attach_vim}
  require'nvim_lsp'.rust_analyzer.setup{on_attach=on_attach_vim}
  require'nvim_lsp'.vimls.setup{on_attach=on_attach_vim}
END

function! s:ConfigureBuffer() abort
    nnoremap <silent><buffer> ld    <cmd>lua vim.lsp.util.show_line_diagnostics<CR>
    nnoremap <silent><buffer> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent><buffer> K     <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <silent><buffer> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <silent><buffer> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <silent><buffer> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <silent><buffer> gr    <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <silent><buffer> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>

    if exists('+signcolumn')
      setlocal signcolumn=yes
    endif
endfunction

augroup lsp
  autocmd!
  autocmd Filetype python,haskell,scala,rust,bash,css setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()
augroup END

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:completion_confirm_key = ""
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ completion#trigger_completion()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
