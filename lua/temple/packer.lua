local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- The best plugin ever, actually useful
    use { 'Seba244c/actions.nvim', require = { { 'akinsho/toggleterm.nvim' } } }
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'nvim-telescope/telescope-ui-select.nvim' }

    use 'folke/tokyonight.nvim'
    use 'navarasu/onedark.nvim'
    use {
        'tanvirtin/monokai.nvim',
        config = function()
            require('monokai').setup { palette = require('monokai').pro }
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
    use 'nvim-treesitter/playground'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use 'mfussenegger/nvim-jdtls'

    use 'numToStr/Comment.nvim'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use { 'akinsho/toggleterm.nvim', tag = '*' }

    -- Buffer
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }

    -- Dashboard
    use {
        'startup-nvim/startup.nvim',
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    use {
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require("notify")
        end
    }

    use 'simrat39/symbols-outline.nvim'

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        requires = {
            -- Actual LSP Support
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        }
    }
    if packer_bootstrap then
        require('packer').sync()
    end
end)
