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
            package_uninstalled = "✗"
        }
    }
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
_mason_cfg.setup({
    -- 确保安装，根据需要填写
    ensure_installed = {"lua_ls", "tsserver", "bashls", "dockerls", "html", "jsonls", "pyright", "yamlls"}
})

local keyAttach = function(bufnr)
  local function buf_set_keymap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
  end
  -- 绑定快捷键
  require("keybindings").mapLSP(buf_set_keymap)
end

-- 禁用格式化功能，交给专门插件插件处理
local disableFormat = function(client)
  if vim.fn.has("nvim-0.8") == 1 then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  else
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
    lua_ls_opts = require("lsp.lua"), -- lua/lsp/config/lua.lua
    -- bashls = require("lsp.config.bash"),
    pyright_opts = require("lsp.python")
    -- html = require("lsp.config.html"),
    -- jsonls = require("lsp.config.json"),
    -- yamlls = require("lsp.config.yamlls"),
    -- cmake = require("lsp.config.cmake"),
}

local lsp_flags = {
    debounce_text_changes = 150
}

_lspconfig.lua_ls.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      disableFormat(client)
      keyAttach(bufnr)
    end,
    settings = servers.lua_ls_opts.settings,
    flags = lsp_flags
}

_lspconfig.pyright.setup {
    flags = lsp_flags,
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      disableFormat(client)
      keyAttach(bufnr)
    end,
    settings = servers.pyright_opts.settings
}

require("lsp.cmp")


