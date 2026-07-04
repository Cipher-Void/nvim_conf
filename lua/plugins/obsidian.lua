return {
    {
        'obsidian-nvim/obsidian.nvim',
        lazy = true,
        ft = "markdown",
        event = {
            "BufReadPre " .. vim.fn.expand("~") ..  "/obsidian/**.md",
            "BufNewFile "  .. vim.fn.expand("~") .. "/obsidian/**.md",
        },

        dependencies = {
            "nvim-lua/plenary.nvim",
            'nvim-telescope/telescope.nvim',
        },

        opts = function()
            local deflt_opts = {
                legacy_commands = false,
                picker = { name = "telescope.nvim" },
                open_notes_in = "current",
				ui         = { enable = false },
                statusline = { enabled = false },
                footer     = { enabled = false },
                sync       = { enabled = false },
                checkbox = {
                    enabled = true,
                    create_new = true,
                    order = { " ", "x", "~" },                },
                note_id_func = require("obsidian.builtin").title_id,
            }


			-- Динамическое добавление workspaces
            local workspaces = {}
            local claude_workspaces_dir = vim.fn.expand("~/obsidian")
            local workspaces_dirs = vim.fn.glob(claude_workspaces_dir .. "/*", false, true)
            for ind, workspace_dir in ipairs(workspaces_dirs) do
                if vim.fn.isdirectory(workspace_dir) == 1 then
                    local workspace_name = vim.fn.fnamemodify(workspace_dir, ":t")
                    table.insert(workspaces, {
                        name = workspace_name,
                        path = workspace_dir
                    })
                end
            end
            deflt_opts.workspaces = workspaces
            

            -- check dir of templates
            local template_dir = "_HybridSystem/templates"
            if vim.fn.isdirectory(template_dir) == 1 then
                deflt_opts.templates = {
                    folder = template_dir,
                    date_format = "%Y-%m-%d",
                    time_format = "%H:%M",
                }
            end

            return deflt_opts 
        end,

        keys = function()
			return {
				-- Заметки
				{ "<leader>on", "<cmd>Obsidian new<cr>",                desc = "Obsidian: New [n]ote" },
				{ "<leader>oN", "<cmd>Obsidian new_from_template<cr>",  desc = "Obsidian: [N]ew from template" },
				{ "<leader>oo", "<cmd>Obsidian open<cr>",               desc = "Obsidian: [o]pen in app" },
				{ "<leader>oq", "<cmd>Obsidian quick_switch<cr>",       desc = "Obsidian: [q]uick switch" },
				{ "<leader>or", "<cmd>Obsidian rename<cr>",             desc = "Obsidian: [r]ename note" },
				{ "<leader>oc", "<cmd>Obsidian toc<cr>",                desc = "Obsidian: table of [c]ontents" },

				-- Поиск и навигация
				{ "<leader>os", "<cmd>Obsidian search<cr>",             desc = "Obsidian: [s]earch" },
				{ "<leader>ot", "<cmd>Obsidian tags<cr>",               desc = "Obsidian: [t]ags" },
				{ "<leader>ob", "<cmd>Obsidian backlinks<cr>",          desc = "Obsidian: [b]acklinks" },
				{ "<leader>ol", "<cmd>Obsidian link<cr>",               desc = "Obsidian: [l]ink selection", mode = "v"  },
				{ "<leader>oL", "<cmd>Obsidian link_new<cr>",           desc = "Obsidian: [L]ink to new note", mode = "v"  },

				-- Daily notes
				{ "<leader>od", "<cmd>Obsidian today<cr>",              desc = "Obsidian: [d]aily note (today)" },
				{ "<leader>oy", "<cmd>Obsidian yesterday<cr>",          desc = "Obsidian: [y]esterday's note" },
				{ "<leader>om", "<cmd>Obsidian tomorrow<cr>",           desc = "Obsidian: to[m]orrow's note" },
				{ "<leader>oD", "<cmd>Obsidian dailies<cr>",            desc = "Obsidian: list [D]ailies" },

				-- Чекбоксы / выделение
				{ "<leader>ox", "<cmd>Obsidian toggle_checkbox<cr>",    desc = "Obsidian: toggle checkbo[x]" },
				{ "<leader>oe", "<cmd>Obsidian extract_note<cr>",       desc = "Obsidian: [e]xtract note", mode = "v" },

				-- Вложения
				{ "<leader>op", "<cmd>Obsidian paste_img<cr>",          desc = "Obsidian: [p]aste image" },

				-- Workspace
				{ "<leader>ow", "<cmd>Obsidian workspace<cr>",          desc = "Obsidian: switch [w]orkspace" },

				-- Служебное
				{ "<leader>oH", "<cmd>Obsidian check<cr>",              desc = "Obsidian: [H]ealth check" },
				{ "gd",         "<cmd>Obsidian follow_link<cr>",        desc = "Obsidian: Follow link", ft = "markdown" },
			}
		end,
	},
    {
        "MeanderingProgrammer/render-markdown.nvim",
        lazy = true,
        ft = "markdown",
        dependencies = { 
            'nvim-treesitter/nvim-treesitter', 
            { 'echasnovski/mini.icons', opts = {}, },
        },
        opts = {
            render_modes = { "n", "c", "t" },
            anti_conceal = { enabled = false },
            latex        = { enabled = false },
            pipe_table   = { enabled = false },
            win_options = { concealcursor = { rendered = 'nvic' }},
            code = {
                disable_background = true
            },
            preset = "obsidian",
        },
    },
    {
        'ice345/markdown-table-wrap.nvim', 
        ft = "markdown", 
        opts = {},
        keys = {
            { "<leader>mt", "<cmd>MarkdownTableTogglePreview<cr>",        desc = "Toggle Markdown table preview" },
            { "<leader>mp", "<cmd>MarkdownTablePreview<cr>",              desc = "Preview Markdown table inline" },
            { "<leader>mf", "<cmd>MarkdownTableFloatPreview<cr>",         desc = "Float Markdown table preview" },
            { "<leader>mc", "<cmd>MarkdownTableClosePreview<cr>",         desc = "Close Markdown table preview" },
            { "<leader>mq", "<cmd>MarkdownTableToggleInlineViewport<cr>", desc = "Toggle inline table viewport" },

            { "]c", "<cmd>MarkdownTableNextCell<cr>",                     desc = "Next table cell", mode = { "n", "i", "v", "o" } },
            { "[c", "<cmd>MarkdownTablePrevCell<cr>",                     desc = "Previous table cell", mode = { "n", "i", "v", "o" } }, 
            { "]r", "<cmd>MarkdownTableNextRow<cr>",                      desc = "Next table row", mode = { "n", "i", "v", "o" } },
            { "[r", "<cmd>MarkdownTablePrevRow<cr>",                      desc = "Previous table row", mode = { "n", "i", "v", "o" } },
        }
    },
}
