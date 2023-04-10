require("symbols-outline").setup {
    opts = {
    }
}

vim.keymap.set("n", "<leader>o", require("symbols-outline").open_outline)
