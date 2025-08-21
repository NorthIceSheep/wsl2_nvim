# 快捷键合集,learder == 空格 == “ ”
## bufferline
### “ ” + b + r  ：rename current file
### " " + b + n  : creat a new file open in a new buffer
### " " + h + h  : open README.md 
### " " + b + h  : 切换到前一个buffer
### " " + b + l  : 切换到后一个buffer
### " " + h + g  : 关闭当前buffer 
### " " + b + o  : close onthers 关闭除当前buffer外所有buffer 
### " " + b + p  : pick 出现字母，按下选择buffer，注意字母的大小写
### " " + h + c  : close,选择字母关闭buffer
##  Ctrl + z     : 撤回  
## “ ” + n + e   : open nvim-tree 文件树
## “ ” + t + s   : open TeleScope : 连按两下关闭Telescope
## “ ‘ + h + p   : hop,选择单词最后一个字母跳转。 
## “ ” + m + d   : markview编辑和阅读模式切换。
##  lspsaga 
### " " + l + r  : choose a word rename 
### " " + l + c  : lsp code action 代码修改建议
### " " + l + d  : 跳转函数定义：go to defination
### " " + l + h  : 帮助文档
### " " + l + R  : lsp finder
### " " + l + n  : Lspsaga diagnostic_jump_next 报错
### " " + l + p  : Lspsaga diagnostic_jump_prev
## surroud
### ysiw + "" 等 : 添加包围   "appel" 
### csiw         : change   "apple"   "( apple )" 
### dsiw         :
### ysiw)    # 用 () 包裹光标所在单词
### yss"     # 用 "" 包裹当前整行
### ds{char} → “delete surround”

### 例子：
### (hello) 执行 ds) → hello hello
### "hello" 执行 ds" → hello

### cs{old}{new} → “change surround”
### change:
### 例子：
### (hello) 执行 cs)" → "hello"
### 'hello' 执行 cs'" → "hello"
###  可视模式下 选中 S"  shift + s + "  "ex"


