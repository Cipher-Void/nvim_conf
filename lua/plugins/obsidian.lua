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
        },

        opts = function()
            local deflt_opts = {
                legacy_commands = false,
                picker = { name = "telescope.nvim" },
                open_notes_in = "current",
				ui = { enable = false },
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
			local function heading_set(level)
				return function()
					local line = vim.api.nvim_get_current_line()
                    if level == 0 then
                        line = string.gsub(line, "^#*%s*", "")
                    else
                        line = string.gsub(line, "^#*%s*", string.rep("#", level) .. " ")
                    end
                    vim.api.nvim_set_current_line(line)
				end
			end

			local function heading_increase()
				local line = vim.api.nvim_get_current_line()
                local head = string.match(line, "^#*")
                if #head < 6 then
                    line = string.gsub(line, "^#*%s*", string.rep("#", #head + 1) .. " ")
                    vim.api.nvim_set_current_line(line)
                end 
			end

			local function heading_decrease()
				local line = vim.api.nvim_get_current_line()
                local head = string.match(line, "^#+")
				if not head then return end
                if #head == 1 then
                    line = string.gsub(line, "^#*%s*", "")
                else 
                    line = string.gsub(line, "^#*%s*", string.rep("#", #head - 1) .. " ")
                end 
                vim.api.nvim_set_current_line(line)
			end

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
				{ "<leader>of", "<cmd>Obsidian follow_link<cr>",        desc = "Obsidian: [f]ollow link" },
				{ "<leader>ol", "<cmd>Obsidian link<cr>",               desc = "Obsidian: [l]ink selection" },
				{ "<leader>oL", "<cmd>Obsidian link_new<cr>",           desc = "Obsidian: [L]ink to new note" },

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

                -- Работа с заголовками
				{ "<leader>oh0", heading_set(0),     			   		desc = "Obsidian MD: Remove heading" },
				{ "<leader>oh1", heading_set(1),     	   			    desc = "Obsidian MD: Heading 1" },
				{ "<leader>oh2", heading_set(2),     	           		desc = "Obsidian MD: Heading 2" },
				{ "<leader>oh3", heading_set(3),                   		desc = "Obsidian MD: Heading 3" },
				{ "<leader>oh4", heading_set(4),                   		desc = "Obsidian MD: Heading 4" },
				{ "<leader>oh5", heading_set(5),                   		desc = "Obsidian MD: Heading 5" },
				{ "<leader>oh6", heading_set(6),                   		desc = "Obsidian MD: Heading 6" },
				{ "<leader>oh=", heading_increase, 				   		desc = "Obsidian MD: Heading increase" },
				{ "<leader>oh-", heading_decrease,   		       		desc = "Obsidian MD: Heading decrease" },
			}
		end,
	},
    {
        "MeanderingProgrammer/render-markdown.nvim",
        lazy = true,
        ft = "markdown",
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
        opts = {
            anti_conceal = { enabled = false },
            code = {
                disable_background = true
            },
        },
    },
}
