return {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    branch = "master", -- 详见本系列的附录
    lazy = false,
    opts = {

        ensure_installed = {
            "lua", 
            "markdown",
            "markdown_inline",
            "python",
            "bash",
            "json",
            "yaml",
        },
        highlight = { enable = true }
    },
}

