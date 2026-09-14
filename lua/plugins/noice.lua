return {
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          view = "notify", -- или "split", "popup"
          filter = {
            event = "msg_show",
            kind = { "shell_out", "shell_err" },
          },
        },
      },
    },
  },
}
