local status, _plg = pcall(require, "nvim-treesitter")
if not status then
    vim.notify("没有找到 nvim-treesitter")
  return
end

_plg.setup({
  ensure_installed = { "c", "lua", "cpp", "vim", "help", "json", "python", "javascript" },
  highlight = { enable = true },
  indent = { enable = true },
  -- 不同括号颜色区分
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
})

