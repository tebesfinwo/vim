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
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/deoplete-lsp'
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


"  Deoplete
let g:deoplete#enable_at_startup = 1


" nvim-lsp
set completeopt-=preview

lua << END
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = false,
      signs = true,
      update_in_insert = true,
    }
  )

  require'nvim_lsp'.bashls.setup{}
  require'nvim_lsp'.hie.setup{}
  require'nvim_lsp'.jsonls.setup{}
  require'nvim_lsp'.metals.setup{}
  require'nvim_lsp'.pyls.setup{}
  require'nvim_lsp'.rust_analyzer.setup{}
  require'nvim_lsp'.vimls.setup{}
END

augroup lsp
  autocmd!
  autocmd Filetype python,haskell,scala,rust,bash,css, setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup end

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>

nnoremap <silent> sd    <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> [g    <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> ]g    <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

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
