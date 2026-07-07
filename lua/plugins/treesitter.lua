return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- lazy = vim.fn.argc() > 0,
        event = { "VeryLazy", "LazyFile" },
        opts = {
            ensure_installed = {
                "python",
                "ninja",
                "rst",
                "javascript",
                "typescript",
                "tsx",
                "css",
                "scss", 
                "html",
                "json",
                "bash",
                "lua",
                "markdown", "markdown_inline"
            },
            highlight = { enable = true },
        },
    } 
}
