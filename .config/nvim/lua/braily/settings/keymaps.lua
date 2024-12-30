-- Here we store our keymaps

-- Switch to the next buffer
vim.api.nvim_set_keymap("n", "<leader>o", ":bnext<CR>", {
    noremap = true,
    silent = true,
    desc = "Next Buffer",
})

-- Switch to the previous buffer
vim.api.nvim_set_keymap("n", "<leader>e", ":bprev<CR>", {
    noremap = true,
    silent = true,
    desc = "Previous Buffer",
})

-- Escape from terminal mode
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {
    noremap = true,
    silent = true,
    desc = "Escape Terminal Mode",
})

-- Split window horizontally
vim.api.nvim_set_keymap("n", "<leader>ws", ":split<CR>", {
    noremap = true,
    silent = true,
    desc = "Horizontal Window Split",
})

-- Split window vertically
vim.api.nvim_set_keymap("n", "<leader>wv", ":vsplit<CR>", {
    noremap = true,
    silent = true,
    desc = "Vertical Window Split",
})

-- Navigate between windows
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {
    noremap = true,
    silent = true,
    desc = "Navigate to the left window",
})

vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {
    noremap = true,
    silent = true,
    desc = "Navigate to the bottom window",
})

vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {
    noremap = true,
    silent = true,
    desc = "Navigate to the top window",
})

vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {
    noremap = true,
    silent = true,
    desc = "Navigate to the right window",
})

-- Resize windows
vim.api.nvim_set_keymap("n", "<leader>wh", ":vertical resize -5<CR>", {
    noremap = true,
    silent = true,
    desc = "Resize window to the right",
})

vim.api.nvim_set_keymap("n", "<leader>wl", ":vertical resize +5<CR>", {
    noremap = true,
    silent = true,
    desc = "Resize window to the left",
})

vim.api.nvim_set_keymap("n", "<leader>mp", ":MarkdownPreview<CR>", {
    noremap = true,
    silent = true,
})
