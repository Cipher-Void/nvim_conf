return {
    {
        "folke/snacks.nvim",
        lazy = vim.fn.argc() > 0, 
        opts = {
            dashboard = {
                preset = {
                    pick = function(cmd, opts)
                        return LazyVim.pick(cmd, opts)()
                    end,
                    header = [[
   █████████   ███            █████                         █████   █████           ███      █████ █████   █████  ███                 
  ███░░░░░███ ░░░            ░░███                         ░░███   ░░███           ░░░      ░░███ ░░███   ░░███  ░░░                  
 ███     ░░░  ████  ████████  ░███████    ██████  ████████  ░███    ░███   ██████  ████   ███████  ░███    ░███  ████  █████████████  
░███         ░░███ ░░███░░███ ░███░░███  ███░░███░░███░░███ ░███    ░███  ███░░███░░███  ███░░███  ░███    ░███ ░░███ ░░███░░███░░███ 
░███          ░███  ░███ ░███ ░███ ░███ ░███████  ░███ ░░░  ░░███   ███  ░███ ░███ ░███ ░███ ░███  ░░███   ███   ░███  ░███ ░███ ░███ 
░░███     ███ ░███  ░███ ░███ ░███ ░███ ░███░░░   ░███       ░░░█████░   ░███ ░███ ░███ ░███ ░███   ░░░█████░    ░███  ░███ ░███ ░███ 
 ░░█████████  █████ ░███████  ████ █████░░██████  █████        ░░███     ░░██████  █████░░████████    ░░███      █████ █████░███ █████
  ░░░░░░░░░  ░░░░░  ░███░░░  ░░░░ ░░░░░  ░░░░░░  ░░░░░          ░░░       ░░░░░░  ░░░░░  ░░░░░░░░      ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░ 
                    ░███                                                                                                              
                    █████                                                                                                             
                   ░░░░░                                                                                                              
                    ]],


--                     header = [[
--    █████████   ███            █████                         █████   █████           ███      █████  
--   ███░░░░░███ ░░░            ░░███                         ░░███   ░░███           ░░░      ░░███   
--  ███     ░░░  ████  ████████  ░███████    ██████  ████████  ░███    ░███   ██████  ████   ███████   
-- ░███         ░░███ ░░███░░███ ░███░░███  ███░░███░░███░░███ ░███    ░███  ███░░███░░███  ███░░███   
-- ░███          ░███  ░███ ░███ ░███ ░███ ░███████  ░███ ░░░  ░░███   ███  ░███ ░███ ░███ ░███ ░███   
-- ░░███     ███ ░███  ░███ ░███ ░███ ░███ ░███░░░   ░███       ░░░█████░   ░███ ░███ ░███ ░███ ░███   
--  ░░█████████  █████ ░███████  ████ █████░░██████  █████        ░░███     ░░██████  █████░░████████  
--   ░░░░░░░░░  ░░░░░  ░███░░░  ░░░░ ░░░░░  ░░░░░░  ░░░░░          ░░░       ░░░░░░  ░░░░░  ░░░░░░░░   
--                     ░███                                                                            
--                     █████   █████   █████  ███                                                      
--                    ░░░░░   ░░███   ░░███  ░░░                                                       
--                             ░███    ░███  ████  █████████████                                       
--                             ░███    ░███ ░░███ ░░███░░███░░███                                      
--                             ░░███   ███   ░███  ░███ ░███ ░███                                      
--                              ░░░█████░    ░███  ░███ ░███ ░███                                      
--                                ░░███      █████ █████░███ █████                                     
--                                 ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░                                      
--                    ]],
                    -- stylua: ignore
                    ---@type snacks.dashboard.Item[]
                    keys = {
                        { icon = "💼", key = "o", desc = "Open Project", action = ":n ." },  -- TODO: Сделать выбор проекта
                        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                        -- { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
                        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
                },
                
            },
            bigfile = { enabled = false },
            explorer = { enabled = false },
            indent = { enabled = false },
            input = { enabled = false },
            picker = { enabled = false },
            notifier = { enabled = false },
            quickfile = { enabled = false },
            scope = { enabled = false },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },
        },
    },
    -- Color schemes
    -- {'morhetz/gruvbox'},
    -- {'ayu-theme/ayu-vim'},
    -- {'sainnhe/gruvbox-material'},
    {'rebelot/kanagawa.nvim'},
}

