return {
    {
        'epwalsh/obsidian.nvim',
        lazy = true,
        ft = "markdown",
        event = {
            "BufReadPre " .. vim.fn.expand("~") ..  "/obsidian/**.md",
            "BufNewFile "  .. vim.fn.expand("~") .. "/obsisian/**.md",
        },

        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = function()
            local deflt_opts = {
                completion = {
                    nvim_cmp = true,
                    min_chars = 2,
                },
                open_notes_in = "current",
				ui = {
					enable = false,
				},
            }

            local workspaces = {}
            local claude_workspaces_dir = "~/obsidian"
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
            local template_dir = "_HybridSystem/Template"
            if vim.fn.isdirectory(template_dir) == 1 then
                deflt_opts.templates = {
                    folder = "_HybridSystem/Template",
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
					-- Убираем существующий заголовок
					local content = line:gsub("^#+%s*", "")
					if level == 0 then
						-- Убрать заголовок полностью
						vim.api.nvim_set_current_line(content)
					else
						local hashes = string.rep("#", level)
						vim.api.nvim_set_current_line(hashes .. " " .. content)
					end
				end
			end

			local function heading_increase()
				local line = vim.api.nvim_get_current_line()
				local level = line:match("^(#+)%s")
				if not level then
					-- Нет заголовка — делаем H1
					vim.api.nvim_set_current_line("# " .. line)
				elseif #level < 6 then
					vim.api.nvim_set_current_line("#" .. line)
				end
			end

			local function heading_decrease()
				local line = vim.api.nvim_get_current_line()
				local level = line:match("^(#+)%s")
				if not level then return end
				if #level == 1 then
					-- H1 → убрать заголовок
					vim.api.nvim_set_current_line(line:gsub("^#%s+", ""))
				else
					vim.api.nvim_set_current_line(line:sub(2))
				end
			end

			return {
				{ "<leader>on", "<cmd>ObsidianNew<cr>",            desc = "Obsidian: New [n]ote" },
				{ "<leader>oo", "<cmd>ObsidianOpen<cr>",           desc = "Obsidian: [O]pen in app" },
				{ "<leader>of", "<cmd>ObsidianSearch<cr>",         desc = "Obsidian: Search notes([F]ind)" },
				{ "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>",    desc = "Obsidian: [Q]uick switch" },
				{ "<leader>od", "<cmd>ObsidianDailies<cr>",        desc = "Obsidian: [D]aily notes" },
				{ "<leader>ot", "<cmd>ObsidianTags<cr>",           desc = "Obsidian: Browse [t]ags" },
				{ "<leader>ol", "<cmd>ObsidianLinks<cr>",          desc = "Obsidian: [L]inks in note" },
				{ "<leader>ob", "<cmd>ObsidianBacklinks<cr>",      desc = "Obsidian: [B]acklinks" },
				{ "<leader>or", "<cmd>ObsidianRename<cr>",         desc = "Obsidian: [R]ename note" },
				{ "<leader>oc", "<cmd>ObsidianToggleCheckbox<cr>", desc = "Obsidian: Toggle [c]heckbox" },
				{ "<leader>oT", "<cmd>ObsidianTemplate<cr>",       desc = "Obsidian: Insert [t]emplate" },
				{ "gd",         "<cmd>ObsidianFollowLink<cr>",     desc = "Obsidian: Follow link" },
                -- Работа с заголовками
				{ "<leader>oh0", heading_set(0),     			   desc = "Obsidian MD: Remove heading" },
				{ "<leader>oh1", heading_set(1),     			   desc = "Obsidian MD: Heading 1" },
				{ "<leader>oh2", heading_set(2),     	           desc = "Obsidian MD: Heading 2" },
				{ "<leader>oh3", heading_set(3),                   desc = "Obsidian MD: Heading 3" },
				{ "<leader>oh4", heading_set(4),                   desc = "Obsidian MD: Heading 4" },
				{ "<leader>oh5", heading_set(5),                   desc = "Obsidian MD: Heading 5" },
				{ "<leader>oh6", heading_set(6),                   desc = "Obsidian MD: Heading 6" },
				{ "<leader>oh=", heading_increase, 				   desc = "Obsidian MD: Heading increase" },
				{ "<leader>oh-", heading_decrease,   		       desc = "Obsidian MD: Heading decrease" },
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
