local packer = require("packer")
packer.startup({
  function(use)
    -- 管理自己 manage itself
    use 'wbthomason/packer.nvim'
    -- 插件列表 Plugin list
    
    -- 主题 Themes
    use("folke/tokyonight.nvim")

    -- 工具 utility
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    use({ "nvim-lualine/lualine.nvim", tag = "v3.*", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    use("ahmedkhalf/project.nvim")    
    -- telescope extensions
    use "LinArcX/telescope-env.nvim"
    -- dashboard-nvim 
    use{"glepnir/dashboard-nvim", event = "VimEnter"}

    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
  },
})


pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin.lua source <afile> | PackerSync
    augroup end
  ]]
)
