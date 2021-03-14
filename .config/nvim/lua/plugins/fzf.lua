vim.api.nvim_command([[let g:fzf_action = {"ctrl-t": "tab split", "ctrl-x": "split", "ctrl-v": "vsplit"}]])
vim.api.nvim_set_keymap("n", "<C-p>", ":GFiles<CR>", {noremap=true, silent=false})
vim.api.nvim_set_keymap("n", "<C-g>", ":Ag<CR>", {noremap=true, silent=false})
vim.api.nvim_set_keymap("n", "<leader>l", ":Buffers<CR>", {noremap=true, silent=true})
