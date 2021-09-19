-- Search
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartcase = true

-- General
vim.o.autoindent = true
vim.o.autoread = true
vim.o.backspace = "indent,eol,start"
vim.o.conceallevel = 0
vim.o.directory = "~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp"
vim.o.encoding = "utf8"
vim.o.expandtab = true
vim.o.history = 700
vim.o.magic = true
vim.o.matchpairs = vim.o.matchpairs .. ",<:>"
vim.o.matchtime = 2
vim.o.belloff = "all"
vim.o.shiftround = true
vim.o.shiftwidth = 4
vim.o.showmatch = true
vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.textwidth = 79
vim.o.timeoutlen = 500
vim.o.wrap = true
vim.o.wildignore = "*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,.git\\*,.hg\\*,.svn\\*"

-- UI
vim.cmd("syntax on")
vim.cmd("colorscheme dracula")
vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")
vim.o.termguicolors = true
vim.o.wildoptions = "pum"
vim.o.number = true
vim.o.ruler = true
