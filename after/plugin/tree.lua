-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Setup
local nvim_tree = require("nvim-tree")

nvim_tree.setup {
    filters = {
        dotfiles = true,
    },
    view = {
        width = 30,
        mappings = {
            list = {
                { key = 'o', action = 'open' }
            }
        }
    }
}

-- Open function
local function open_nvim_tree()
    require("nvim-tree").focus()
end

vim.keymap.set("n", "<leader>pp", open_nvim_tree)
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
