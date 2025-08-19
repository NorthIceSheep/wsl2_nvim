--显示行号
vim.opt.number = true
--显示相对行号
vim.opt.relativenumber = true
--高亮当前行
vim.opt.cursorline = true
--高亮某一列，一般用来限定一行代码的长度，养成好的编码习惯
vim.opt.colorcolumn = "80"
--"80"是字符串
--敲下tab自动转换为空格
vim.opt.expandtab = true
--设置一个tab对应多少个空格数
vim.opt.tabstop = 4
--neovim默认会按内部的函数shiftwidth缩进，而不是tabstop个，所以需要设置如下：
--这样它会和vim.opt.tabstop保持一致
vim.opt.shiftwidth = 0
--自动加载外部修改
vim.opt.autoread = true
--分屏设置
vim.opt.splitbelow = true
vim.opt.splitright = true
-- 搜索时忽略大小写
-- 启用 smartcase：当搜索模式中有大写字母时，忽略 ignorecase 设置
-- 也就是说：
--   1. 如果搜索关键词全是小写，则忽略大小写
--        :/word     可以匹配 word、Word、WORD 等
--   2. 如果搜索关键词中带有大写字母，则大小写敏感
--        :/Word     只匹配 Word，不匹配 word/WORD
vim.opt.ignorecase = true
vim.opt.smartcase = true
