vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)

-- Cool magical move lines function
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keeps cursor in middle whilst searching, and stuff
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

