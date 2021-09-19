" ================ PLUGIN SETUP ============== {{{
execute 'source' fnameescape(expand('~/.config/nvim/plugins.vim'))
" }}}

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType haskell,python autocmd BufWritePre <buffer> %s/\s\+$//e

    autocmd FileType python setlocal commentstring=#\ %s
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

    autocmd BufEnter *.vim setlocal tabstop=2
    autocmd BufEnter *.vim setlocal shiftwidth=2
    autocmd BufEnter *.vim setlocal softtabstop=2

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

luafile ~/.config/nvim/lua/mappings.lua
luafile ~/.config/nvim/lua/settings.lua
