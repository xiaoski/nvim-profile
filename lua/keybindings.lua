vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {
    noremap = true,
    silent = true
}

-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- ============================================
-- 插件快捷键
-- ============================================
local pluginKeys = {}

-- --------------------------------------------------------
-- bufferline
--
pluginKeys.mapBufferline = function()
    map("n", "<A-h>", ":BufferLineCyclePrev<CR>", opt)
    map("n", "<A-l>", ":BufferLineCycleNext<CR>", opt)
    map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opt)
    map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opt)
    map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opt)
    map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opt)
    map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opt)
    map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opt)
    map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opt)
    map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opt)
    map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opt)
    map("n", "<leader>bg", ":BufferLinePick<CR>", opt)
    map("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)
    map("n", "<leader>bo", ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>", opt)

end
-- --------------------------------------------------------
-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-t>", ":NvimTreeToggle<CR>", opt)

-- --------------------------------------------------------
-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

pluginKeys.telescopeList = {
    i = {
        -- 关闭窗口
        ["<C-c>"] = "close",
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
        ["<C-h>"] = "which_key"
    }
}

-- -------------------------------------------------------
-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
    -- rename
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    -- code action
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    -- go xx
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    -- diagnostic
    map("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    map("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    map("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
    -- 没用到
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- -----------------------------------------------------
-- toggketerm
-- 打开终端
pluginKeys.toggleterm = {
    open = [[<c-\>]]
}

pluginKeys.cmp = function(cmp)
    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    return {
        -- 上一个
        ["<A-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<A-j>"] = cmp.mapping.select_next_item(),
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        -- 取消
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 确认
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"})
    }
end

return pluginKeys
