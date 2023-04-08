require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = "gruvbox-material",
        disabled_filetypes = { 'packer', 'NvimTree' }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
}
