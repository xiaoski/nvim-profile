(require("lazy")).setup({
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },
    {
        'akinsho/bufferline.nvim', 
        version = "*", 
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    "nvim-treesitter/nvim-treesitter",
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate" 
    },
    "williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
    "neovim/nvim-lspconfig",
     -- 补全源
     "hrsh7th/nvim-cmp",
     "hrsh7th/vim-vsnip",
     "hrsh7th/cmp-vsnip",
     "hrsh7th/cmp-nvim-lsp", -- { name = nvim_lsp }
     "hrsh7th/cmp-buffer", -- { name = 'buffer' },
     "hrsh7th/cmp-path", -- { name = 'path' }
     "hrsh7th/cmp-cmdline", -- { name = 'cmdline' }
     "hrsh7th/cmp-nvim-lsp-signature-help", -- { name = 'nvim_lsp_signature_help' }
     "rafamadriz/friendly-snippets",
  });

require("config.nvim-tree")
require("config.noice")
require("config.lualine")
require("config.bufferline")
require("config.toggleterm")
require("config.nvim-treesitter")
require("which-key").setup({})

--
