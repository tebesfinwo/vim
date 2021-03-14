vim.api.nvim_command("let NERDTreeIgnore = ['\\.pyc$']")
vim.api.nvim_command("let g:NERDTreeWinPos = 'left'")
vim.api.nvim_command("let g:NERDTreeWinSize=35")
vim.api.nvim_set_keymap("", "<C-n>", ":NERDTreeToggle<CR>", {noremap=false, silent=false})
