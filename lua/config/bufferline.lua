local status, _plg = pcall(require, "bufferline")
if not status then
    vim.notify("没有找到 bufferline")
  return
end

_plg.setup {
    options = {

        mode = "buffers",
        number = "ordinal",
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
            separatpr = true
        }},
    }
}

require("keybindings").mapBufferline()
