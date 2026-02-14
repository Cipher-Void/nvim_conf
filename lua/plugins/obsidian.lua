return {
    {
        'epwalsh/obsidian.nvim',
        lazy = true,
        ft = "markdown",

        dependencies = {
            "nvim-lua/plenary.nvim"
        },

        opts = {
            workspaces = {
                {
                    name = "obsidian",
                    path = "~/obsidian"
                }
            },
            completion = {
                nvim_cmp = true,
            },
			templates = {
				folder = "_HybridSystem/Template",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
			}
        }
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        lazy = true,
        ft = "markdown",
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            code = {
                disable_background = true
            },
            heading = {
                width = 'block',
                left_pad = 2,
                right_pad = 8,
            },
        },
    },
}
