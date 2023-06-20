local status, _plg = pcall(require, "toggleterm")
if not status then
    vim.notify("没有找到 toggleterm")
  return
end

_plg.setup({
    open_mapping = [[<c-\>]],
    -- 打开新终端后自动进入插入模式
    start_in_insert = true,
    -- 在当前buffer的下方打开新终端
    direction = 'horizontal',
    shell = vim.o.shell,
    auto_scroll = true

})
