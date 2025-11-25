return {
    {
      "Jezda1337/nvim-html-css",
      dependencies = { "hrsh7th/nvim-cmp", "nvim-treesitter/nvim-treesitter" }, 
      lazy = true,
      ft = "html,css,scss",
      opts = {
        enable_on = { "html", "css", "less", "scss", "svelte", "htmldjango" },
        handlers = {
          definition = {
            bind = "gd"
          },
          hover = {
            bind = "K",
            wrap = true,
            border = "none",
            position = "cursor",
          },
        },
        documentation = {
          auto_show = true,
        },
        style_sheets = {
          "https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css",
          -- "./index.css", -- `./` refers to the current working directory.
        },
      },
    }
}
