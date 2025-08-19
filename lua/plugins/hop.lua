return { 
    "smoka7/hop.nvim",
    opts = {
        hint_position = 3,
    },
    keys = {
        {"<leader>hp",":HopWord<CR>",silent = true}
    }
}
--[
---- =========================================
-- 关于 <leader>hp （比如空格+h+p）按键说明
-- =========================================
-- 1. <leader>hp 是“顺序按键”，不是组合键
--    例：Leader=空格时，依次按：
--         空格 → h → p
--    而不是同时按下三键
--
-- 2. 按键间隔太慢会失效（受 timeoutlen 限制）
--    默认 timeoutlen = 1000（毫秒）
--    可调整：
--         vim.o.timeoutlen = 500  -- 调整按键等待时间
--
-- 3. 先确保 leader 键已正确定义：
--         vim.g.mapleader = ' '  -- 必须写在 keymap.set() 之前
--
-- 4. 检查快捷键是否被覆盖：
--         :verbose map <leader>hp
--
-- 5. 建议绑定更短的 Hop 快捷键，比如：
--         vim.keymap.set('n', '<leader>w', function()
--           require('hop').hint_words()
--         end, { desc = 'Hop to word' })
--    现在只需：
--         空格 → w
--    两步即可触发 Hop
--
-- =========================================

--]
