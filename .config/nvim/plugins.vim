call plug#begin(expand('~/.config/nvim/plugged'))
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'junegunn/fzf'
    Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
    Plug 'psliwka/vim-smoothie'
    Plug 'rizzatti/dash.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'tpope/vim-commentary'
    Plug 'vim-airline/vim-airline'
    Plug 'Yggdroot/indentLine'
    Plug 'ncm2/float-preview.nvim'

    Plug 'neovim/nvim-lsp'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/deoplete-lsp'
call plug#end()

filetype plugin indent on

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

" float-preview.nvim
let g:float_preview#docked = 1

"  Deoplete
let g:deoplete#enable_at_startup = 1

" nvim-lsp
lua << END
  require'nvim_lsp'.bashls.setup{}
  require'nvim_lsp'.ccls.setup{}
  require'nvim_lsp'.hie.setup{}
  require'nvim_lsp'.jsonls.setup{}
  require'nvim_lsp'.metals.setup{}
  require'nvim_lsp'.pyls.setup{}
  require'nvim_lsp'.rust_analyzer.setup{}
  require'nvim_lsp'.vimls.setup{}
END

function! s:ConfigureBuffer()
    nnoremap <buffer> <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap <buffer> <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <buffer> <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <buffer> <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <buffer> <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <buffer> <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <buffer> <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <buffer> <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>

    if exists('+signcolumn')
      setlocal signcolumn=yes
    endif
endfunction

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#manual_complete()

let g:LspDiagnosticsErrorSign = '✖'
let g:LspDiagnosticsWarningSign = '⚠'
let g:LspDiagnosticsInformationSign = 'ℹ'
let g:LspDiagnosticsHintSign = '➤'
