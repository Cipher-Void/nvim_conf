return {
  {
    "nvim-mini/mini.surround",
    opts = {
      custom_surroundings = {
        -- swap behavior
        -- {}
        ["{"] = { output = { left = "{", right = "}" } }, -- без пробелов
        ["}"] = { output = { left = "{ ", right = " }" } }, -- с пробелами

        -- []
        ["["] = { output = { left = "[", right = "]" } },
        ["]"] = { output = { left = "[ ", right = " ]" } },

        -- ()
        ["("] = { output = { left = "(", right = ")" } },
        [")"] = { output = { left = "( ", right = " )" } },
      },
    },
  },
}
