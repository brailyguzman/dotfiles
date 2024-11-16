-- Here we store our custom vim options

-- Cursor
vim.opt.guicursor = "n-v-c:block,i:ver100,r-cr:hor20,o:hor50"

-- wrap line
vim.opt.wrap = false

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- Indenting
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Term colors
vim.opt.termguicolors = true

-- Disable status line
vim.o.showcmd = false

-- Highlight on search
vim.opt.hlsearch = false

-- Ignore case
vim.opt.ignorecase = true

-- Smart case
vim.opt.smartcase = true

-- Swap
vim.opt.swapfile = false

-- Backup
vim.opt.backup = false

-- Sign column
vim.opt.signcolumn = "yes"

-- Scroll off
vim.opt.scrolloff = 8
