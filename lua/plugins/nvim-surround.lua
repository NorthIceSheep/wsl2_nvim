return {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
}
-- NORMAL 模式：
--  ys{motion}{char}    在 {motion} 选中的文本外围添加 {char}
--    例: ysiw"          给当前单词加双引号 → "word"
--  yss{char}           给当前整行加 {char}
--  yS{motion}{char}    多行包裹（上方换行）
--  ySS{char}           整行多行包裹（上方换行）

-- DELETE：
--  ds{char}            删除包裹字符
--    例: ds"            删除外围的双引号
--  dss                  删除整行包裹字符

-- CHANGE：
--  cs{old}{new}        把旧包裹改成新的
--    例: cs"'           把外围的 "word" 改成 'word'
--  cS{old}{new}        多行包裹替换

-- VISUAL 模式：
--  S{char}             在选中区域外围加 {char}
--  gS{char}            多行包裹

-- 常见 {char}：
--  ) ( ] [ } {         各种括号
--  " ' `               引号
--  t                   HTML / XML 标签（输入 t 后会提示标签名）

