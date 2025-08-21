local function comment_end()
	-- 获取当前行的内容
	local line = vim.api.nvim_get_current_line()
	-- 获取当前行号 (1-based)
	local row = vim.api.nvim_win_get_cursor(0)[1]
	-- 表示当前文本注释的符号
	local commentstring = vim.bo.commentstring -- e.g. "-- %s"
	local comment = commentstring:gsub("%%s", "") -- 变成 "--"
	local index = commentstring:find"%%s"
	-- 一般习惯在注释前加一个空格
	if line:find("%s") then
		comment = " " .. comment
		index = index + 1
	end
	-- 修改当前行
	vim.api.nvim_buf_set_lines(0, row - 1, row, false, { line .. comment })
	-- 设置光标位置
	vim.api.nvim_win_set_cursor(0, { row, #line + index - 2 })
	-- 启动 insert 模式
	vim.api.nvim_feedkeys("a", "n", false)
end
vim.keymap.set("n", "gcv", comment_end)
-- 草！！！！注意%%S和%%s
-- 草！！！！注意%%S和%%s
-- 草！！！！注意%%S和%%s
-- 草！！！！注意%%S和%%s
-- 草！！！！注意%%S和%%s

local function comment_above()
    local line = vim.api.nvim_get_current_line()
    local row = vim.api.nvim_win_get_cursor(0)[1]

    local commentstring = vim.bo.commentstring
    local comment = commentstring:gsub("%%s", "")
    local index = commentstring:find "%%s"

    local blank_chars = (line:find "%S" or #line + 1) - 1
    local blank = line:sub(1, blank_chars)

    vim.api.nvim_buf_set_lines(0, row - 1, row - 1, true, { blank .. comment })
    vim.api.nvim_win_set_cursor(0, { row, #blank + index - 2 })

    vim.api.nvim_feedkeys("a", "n", false)
end


vim.keymap.set("n", "gcb", comment_above)
local function comment_below()
    local row = vim.api.nvim_win_get_cursor(0)[1]

    -- 如果当前行为最后一行，则仍然取用当前行的缩进
    local total_lines = vim.api.nvim_buf_line_count(0)
    local line
    if row == total_lines then
        line = vim.api.nvim_buf_get_lines(0, row - 1, row, true)[1]
    else
        line = vim.api.nvim_buf_get_lines(0, row, row + 1, true)[1]
    end

    local commentstring = vim.bo.commentstring
    local comment = commentstring:gsub("%%s", "")
    local index = commentstring:find "%%s"

    local blank_chars = (line:find "%S" or #line + 1) - 1
    local blank = line:sub(1, blank_chars)

    vim.api.nvim_buf_set_lines(0, row, row, true, { blank .. comment })
    vim.api.nvim_win_set_cursor(0, { row + 1, #blank + index - 2 })

    vim.api.nvim_feedkeys("a", "n", false)

end
 -- 

vim.keymap.set("n", "gcn", comment_below)
--对gcc进行拓展，让gcc可以在normal下可以注释。 
 local function comment_line()
    local line = vim.api.nvim_get_current_line()

    local row = vim.api.nvim_win_get_cursor(0)[1]
    local commentstring = vim.bo.commentstring
    local comment = commentstring:gsub("%%s", "")
    local index = vim.bo.commentstring:find "%%s"

    if not line:find "%S" then
        vim.api.nvim_buf_set_lines(0, row - 1, row, false, { line .. comment })
        vim.api.nvim_win_set_cursor(0, { row, #line + index - 1 })
    else
        require("vim._comment").toggle_lines(row, row, { row, 0 })
    end
end

vim.keymap.set("n", "gcc", comment_line)


--auto change chinese and english input
--local ime_augroup = vim.api.nvim_create_augroup(name:"ImeAugroup",opts:{})
--原理：Windows时间与区域下，安装了中文输入法，英语（美国）两种输入法,
--win + 空格，切换那两个。在windows中运行im-select.exe 可以切换，1033代表英文
--2052代表中文，在nvim命令行里用！path/im-select.exe,让init.lua控制输入法。
local ime_autogroup = vim.api.nvim_create_augroup("ImeAutoGroup", { clear = true })

vim.api.nvim_create_autocmd("InsertLeave", {
    group = ime_autogroup,
    callback = function ()
    vim.cmd(":silent:! /mnt/c/nvim-auto-input/im-select.exe 1033")
    end
})

vim.api.nvim_create_autocmd("InsertEnter", {
    group = ime_autogroup,
    callback = function ()
    vim.cmd(":silent:! /mnt/c/nvim-auto-input/im-select.exe 2052")
    end
})

vim.keymap.set("", "<Esc>", function()
  print("Find ESC:To English")
    vim.cmd(":silent:! /mnt/c/nvim-auto-input/im-select.exe 1033")
    vim.api.nvim_feedkeys(
        -- 把文本 "<Esc>" 转成真正的 Esc 控制码（\x1b）
        vim.api.nvim_replace_termcodes("<Esc>",true,false,true) ,"n", true)
--           参数分别是（字符串本身， 
        -- vim.api.nvim_replace_termcodes("<Esc>",true,false,true) ,"n", true)
end, { silent = true })

-- （① str（"<Esc>"）
-- 要转换的按键字符串。
-- 它可以是任何特殊键（<Esc>、<CR>、<Tab>、<C-x> 等）。
-- 会被转换成 Vim 内部可用的实际控制字符。
-- ② from_part（true）
-- 是否解析 <...> 形式的特殊键码。
-- true → 会把 <Esc>、<CR> 等识别并替换成实际的控制码。
-- false → 会把 <Esc> 当作普通文本 <Esc> 处理，不会变成按键。
-- ③ do_lt（false）
-- 是否把键序列中的 "<lt>" 解析成 < 字符。
-- 在一些映射中，<lt> 表示字面上的 <。
-- 对 <Esc> 这种键我们一般填 false，不需要特殊处理 <lt>。
-- ④ special（true）
-- 是否把 str 中的特殊终端代码（termcodes）转换成转义序列。
-- true → 把 <Esc> 转成真实的 ESC 字符（ASCII 27，也就是 \x1b），可被 nvim_feedkeys 发送。
-- false → 保留 <Esc> 文本形式。）
--
-- 每次打开文件时跳到最后一行
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local last_line = vim.api.nvim_buf_line_count(0)
    vim.api.nvim_win_set_cursor(0, {last_line, 0})
  end
})

