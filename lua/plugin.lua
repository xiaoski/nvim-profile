(require("lazy")).setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000
  },
  {
    "folke/which-key.nvim",
    lazy = true
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
    "arkav/lualine-lsp-progress"
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },
  {
    "ahmedkhalf/project.nvim"
  },
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("pconfig.dashboard")
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  }
});
require("pconfig.nvim-tree")
require("pconfig.bufferline")
require("pconfig.lualine")
require("pconfig.telescope")
require("pconfig.project")
