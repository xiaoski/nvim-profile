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
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim"
      }
    },
  });


require("config.nvim-tree")
require("which-key").setup({})
