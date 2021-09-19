function nnoremap(lhs, rhs)
    vim.api.nvim_set_keymap("n", lhs, rhs, {noremap = true})
end

vim.api.nvim_exec(
[[
let mapleader = ','
let g:mapleader = ','
]],
true
)

nnoremap("<c-j>", "<c-w>j")
nnoremap("<c-k>", "<c-w>k")
nnoremap("<c-h>", "<c-w>h")
nnoremap("<c-l>", "<c-w>l")
