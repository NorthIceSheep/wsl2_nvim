return {
  "nvim-tree/nvim-tree.lua",         -- 主插件
  version = "*",                     -- 可选: 最新版本
  lazy = false,                      -- 可选: 启动立刻加载
  keys = {
            {
        "<leader>ne","<cmd>NvimTreeToggle<CR>", -- 
        mode = "n",silent = true,desc = "Toggle File explorer"
            }
        },
  dependencies = {
    "nvim-tree/nvim-web-devicons",   -- 图标插件
  },
  opts = {
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
  },
}
-- 空格 + n + e 打开nvim-tree文件树 
