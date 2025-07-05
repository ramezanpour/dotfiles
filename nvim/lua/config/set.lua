vim.g.mapleader = ","

-- Editor settings
vim.opt.wrap = true
vim.opt.mouse = "a"
vim.opt.colorcolumn = "120"
vim.opt.clipboard:append("unnamedplus")
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.number = true
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.o.splitright = true
vim.cmd("filetype plugin indent on")
vim.o.updatetime = 250
