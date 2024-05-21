local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        build = function()
            pcall(require('nvim-treesitter.install').update {with_sync = true})
        end
    },
    'github/copilot.vim',
    'theprimeagen/harpoon',
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'theHamsta/nvim-dap-virtual-text',
            'mfussenegger/nvim-dap-python',
            'rcarriga/nvim-dap-ui',
            'nvim-telescope/telescope-dap.nvim'
        }
    },
    'mbbill/undotree',
    {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    config = function()
        require('distant'):setup()
    end
    },
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration

        -- Only one of these is needed, not both.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua"
       },
      config = true
    },
    'christoomey/vim-tmux-navigator',
    'lewis6991/gitsigns.nvim',
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        }
    },
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    {'nvim-tree/nvim-web-devicons'},
    {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'},
    {
        'nvim-telescope/telescope.nvim', version = '0.1.4',
        -- or                            , branch = '0.1.x',
        dependencies = {
            {'nvim-lua/plenary.nvim'},
            {'BurntSushi/ripgrep'}
        }
    },
    ({
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            require("catppuccin").setup()
            vim.cmd('colorscheme catppuccin')
        end
    }),
    {
        ('folke/noice.nvim'),
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify'
        }
    },
    {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},         -- Required
        {'hrsh7th/cmp-nvim-lsp'},     -- Required
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'simrat39/rust-tools.nvim'},
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},             -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }
})
