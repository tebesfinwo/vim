vim.api.nvim_command("let g:smoothie_no_default_mappings = v:true")

local opts = {
    noremap = false,
    silent = false,
}

vim.api.nvim_set_keymap("n", "<C-d>", "<Plug>(SmoothieDownwards)", opts)
vim.api.nvim_set_keymap("n", "<C-e>", "<Plug>(SmoothieUpwards)", opts)
