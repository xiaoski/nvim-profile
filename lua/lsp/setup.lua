local status, _mason = pcall(require, "mason")
if not status then
    vim.notify("没有找到 mason")
  return
end

local status, _mason_cfg = pcall(require, "mason-lspconfig")
if not status then
    vim.notify("没有找到 mason-lspconfig")
  return
end

local status, _lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("没有找到 lspconfig")
  return
end

-- :h mason-default-settings
_mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
_mason_cfg.setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "bashls",
    "dockerls",
    "html",
    "jsonls",
    "pyright",
    "yamlls",
  },
})


local servers = {
  sumneko_lua = require("lsp.lua"), -- lua/lsp/config/lua.lua
  --bashls = require("lsp.config.bash"),
  pyright = require("lsp.python"),
  --html = require("lsp.config.html"),
  --jsonls = require("lsp.config.json"),
  --yamlls = require("lsp.config.yamlls"),
  --cmake = require("lsp.config.cmake"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(_lspconfig[name])
  else
    -- 使用默认参数
    _lspconfig[name].setup({})
  end
end


