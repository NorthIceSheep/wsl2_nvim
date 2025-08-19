-- For `plugins/markview.lua` users.
return {
    "OXY2DEV/markview.nvim",
    lazy = false,

	dependencies = { "nvim-tree/nvim-web-devicons" },
   -- For `nvim-treesitter` users.
    priority = 49,
    -- For blink.cmp's completion
    -- source
    keys = {{"<leader>md","<cmd>Markview<CR>",mode = "n",silent = true}}
    -- dependencies = {
    --     "saghen/blink.cmp"
    -- },
};
