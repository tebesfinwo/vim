require("plugins.airline")
require("plugins.vim-smoothie")
require("plugins.nvim-lspconfig")
require("plugins.fzf")
require("plugins.nerdtree")
require("plugins.rainbow")
require("plugins.nvim-cmp")
-- require("plugins.lspkind")
require("plugins.nvim-treesitter")

vim.cmd("filetype plugin indent on")

-- Python configuration needed by plugins
vim.cmd("let g:loaded_python_provider = 0")
vim.cmd("let g:python3_host_prog = expand('~/.pyenv/versions/py3nvim/bin/python')")

vim.wo.signcolumn = "yes:1"
