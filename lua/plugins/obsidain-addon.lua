return {
  {
    "Cipher-Void/obsidian-addon.nvim",
    -- dev = true,
    -- dir = "~/projects/other/obsidian-addon.nvim/",
    name = "obsidian-addon.nvim",
    lazy = true,
    ft = "markdown",
    opts = {
      picker = "snacks", -- "snacks" | "telescope"
    },
    keys = {
      {
        "<leader>oif",
        function()
          require("obsidian-addon").insert_filename()
        end,
        ft = "markdown",
        desc = "[I]nsert [f]ilename",
      },
      {
        "<leader>ogd",
        function()
          require("obsidian-addon").open_wikilink()
        end,
        mode = { "n", "v" },
        ft = "markdown",
        desc = "Obsidian: [g]o to wikilink",
      },

      -- Работа с заголовками
      {
        "<leader>oh0",
        function()
          require("obsidian-addon").heading_set(0)()
        end,
        ft = "markdown",
        desc = "Obsidian MD: Remove heading",
      },
      {
        "<leader>oh1",
        function()
          require("obsidian-addon").heading_set(1)()
        end,
        ft = "markdown",
        desc = "Obsidian MD: Heading 1",
      },
      {
        "<leader>oh2",
        function()
          require("obsidian-addon").heading_set(2)()
        end,
        ft = "markdown",
        desc = "Obsidian MD: Heading 2",
      },
      {
        "<leader>oh3",
        function()
          require("obsidian-addon").heading_set(3)()
        end,
        ft = "markdown",
        desc = "Obsidian MD: Heading 3",
      },
      {
        "<leader>oh4",
        function()
          require("obsidian-addon").heading_set(4)()
        end,
        ft = "markdown",
        desc = "Obsidian MD: Heading 4",
      },
      {
        "<leader>oh5",
        function()
          require("obsidian-addon").heading_set(5)()
        end,
        ft = "markdown",
        desc = "Obsidian MD: Heading 5",
      },
      {
        "<leader>oh6",
        function()
          require("obsidian-addon").heading_set(6)()
        end,
        ft = "markdown",
        desc = "Obsidian MD: Heading 6",
      },
      {
        "<leader>oh=",
        function()
          require("obsidian-addon").heading_increase()
        end,
        ft = "markdown",
        desc = "Obsidian MD: Heading increase",
      },
      {
        "<leader>oh-",
        function()
          require("obsidian-addon").heading_decrease()
        end,
        ft = "markdown",
        desc = "Obsidian MD: Heading decrease",
      },

      -- Для разработки
      {
        "<leader>myt",
        function()
          require("obsidian-addon").test()
        end,
        desc = "Obsidian MD: test function",
      },
    },
  },
}
