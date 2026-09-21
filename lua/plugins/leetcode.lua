local leet_arg = "leet"
return {
  {
    "kawre/leetcode.nvim",
    dependencies = {
      -- include a picker of your choice, see picker section for more details
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    lazy = leet_arg ~= vim.fn.argv(0, -1),
    opts = {
      arg = leet_arg,
      lang = "python3",
    },
    cmd = "Leet",
    keys = {
      { "<leader>l", "", desc = "+leet" },
      -- Открытие / список
      { "<leader>lL", "<cmd>Leet<cr>", desc = "LeetCode: Open Dashboard" },
      { "<leader>ll", "<cmd>Leet list<cr>", desc = "LeetCode: List Problems" },

      -- Случайная / ежедневная
      { "<leader>lR", "<cmd>Leet random<cr>", desc = "LeetCode: Random Problem" },
      { "<leader>lD", "<cmd>Leet daily<cr>", desc = "LeetCode: Daily Challenge" },
      { "<leader>lt", "<cmd>Leet tabs<cr>", desc = "LeetCode: open all question tabs" },

      -- Запуск / отправка
      { "<leader>lr", "<cmd>Leet run<cr>", desc = "LeetCode: Run Code" },
      { "<leader>ls", "<cmd>Leet submit<cr>", desc = "LeetCode: Submit Solution" },

      -- Сброс / восстановление
      { "<leader>lz", "<cmd>Leet reset<cr>", desc = "LeetCode: Reset Code" },
      { "<leader>lZ", "<cmd>Leet restore<cr>", desc = "LeetCode: Restore Layout" },
      --
      -- Панели: описание / консоль
      { "<leader>ld", "<cmd>Leet desc<cr>", desc = "LeetCode: Toggle Description" },
      { "<leader>lc", "<cmd>Leet console<cr>", desc = "LeetCode: Toggle Console" },

      -- Cookie / кэш
      { "<leader>lC", "<cmd>Leet cookie update<cr>", desc = "LeetCode: Update Cookie" },
    },
  },

  {
    "uga-rosa/translate.nvim",
    cmd = "Translate",
    keys = {
      -- Перевод текущей строки в нормальном режиме
      { "<leader>TT", "<cmd>Translate ru<CR>", desc = "Translate line to Russian" },
      -- Перевод выделенного текста в визуальном режиме
      { "<leader>TT", ":Translate ru<CR>", mode = "v", desc = "Translate selection to Russian" },
      -- Перевод всего буфера в нормальном режиме
      { "<leader>TB", "<cmd>%Translate ru -output=split<CR>", desc = "Translate entire buffer to Russian" }, -- ERROR: кривой сплит в readonly buffer
    },
    opts = {
      default = {
        parse_after = "window",
        output = "floating",
        command = "translate_shell",
      },
    },
  },
}
