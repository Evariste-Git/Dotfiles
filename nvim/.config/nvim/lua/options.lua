vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.wo.relativenumber = true
vim.wo.number = true
vim.o.cursorline = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.diagnostic.config({ virtual_text = true })

