vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set('t', '<C-space>', "<C-\\><C-n><C-w>h", { silent = true })
