local opt = vim.opt
local o = vim.o
-- local g = vim.g

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

opt.guicursor = "n-v-c:block-blinkon100-blinkoff100-blinkwait200,i:ver100-blinkon100-blinkoff100-blinkwait200,r-cr:hor20-blinkon100-blinkoff100-blinkwait200,o:hor50-blinkon100-blinkoff100-blinkwait200"

-- Swap
opt.swapfile = false

-- Backup
opt.backup = false

-- Sign column
opt.signcolumn = "yes"

-- Scroll off
opt.scrolloff = 8

opt.linebreak = true
opt.breakindent = true
