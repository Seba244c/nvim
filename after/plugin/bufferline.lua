require("bufferline").setup {
    options = {
        mode = "buffers",
        show_buffer_icons = true,
        get_element_icon = function(element)
            -- element consists of {filetype: string, path: string, extension: string, directory: string}
            -- This can be used to change how bufferline fetches the icon
            -- for an element e.g. a buffer or a tab.
            -- e.g.
            local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
            return icon, hl
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true
            }
        },
        numbers = "ordinal",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " "
                    or (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
        end,
    }
}

-- Mapping
vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<cr>")
vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<cr>")
vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<cr>")
vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<cr>")
vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<cr>")
vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<cr>")
vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<cr>")
vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<cr>")
vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<cr>")
