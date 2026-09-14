return {
  {
    "ChmaraX/herdr-nvim",
    opts = { keymaps = false },
    -- event = "VeryLazy",
    -- lazy = vim.env.HERDR_SIDEBAR ~= "1", -- если 1 то грузим принудительно
    lazy = false, -- если 1 то грузим принудительно
    keys = {
      { "<leader>ac", "<CMD>Herdr comment<CR>", desc = "Herdr: comment" },
      { "<leader>al", "<CMD>Herdr list<CR>", desc = "Herdr: list" },
      { "<leader>as", "<CMD>Herdr send<CR>", desc = "Herdr: send" },
      { "<leader>aS", "<CMD>Herdr submit<CR>", desc = "Herdr: submit" },
    },
  },
}
