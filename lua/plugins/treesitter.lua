return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = vim.fn.argc() > 0,
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
                "markdown", "markdown_inline"
            },
            highlight = { enable = true },
            rainbow = { enable = true },
        },
    } 
}
