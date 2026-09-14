return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          -- Настройка для проводника (Snacks Explorer)
          explorer = {
            hidden = true, -- Показывать скрытые файлы (.*)
            ignored = true, -- Показывать файлы из .gitignore
            exclude = {
              ".git",
              "*.tmp",
              "*.temp",
              "*.swp",
              "*.swo",
              "*.bak",
              "node_modules", -- JavaScript/TypeScript
              "__pycache__", -- Python
              ".venv",
              "venv",
            },
          },
          -- Настройка для поиска файлов (через <leader>ff)
          files = {
            hidden = true, -- Показывать скрытые файлы
            ignored = true, -- Показывать файлы из .gitignore
            exclude = {
              ".git",
              "*.tmp",
              "*.temp",
              "*.swp",
              "*.swo",
              "*.bak",
              "node_modules", -- JavaScript/TypeScript
              "__pycache__", -- Python
              ".venv",
              "venv",
            },
          },
        },
      },
    },
  },
}
