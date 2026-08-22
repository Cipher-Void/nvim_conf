local enabled = true
return {
  {
    "mason-org/mason-lspconfig.nvim",
    enabled = enabled,
    opts = {
      ensure_installed = {
        "pyright",
        "lua_ls",
        "html",
        "cssls",
        "emmet_ls",
        -- "tsgo",  -- Более быстрый lsp для ts
        "vtsls",
      },
      automatic_enable = true,
    },
  },
  { "mason-org/mason.nvim", enabled = enabled },
}
