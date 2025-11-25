return {
    {
        'hrsh7th/nvim-cmp', 
        dependencies = {
            {
                "hrsh7th/cmp-nvim-lsp",
                event = { "BufReadPre", "BufNewFile" }, 
				config = function()
					local cmp_nvim_lsp = require("cmp_nvim_lsp")
                    -- used to enable autocompletion (assign to every lsp server config)
                    local capabilities = cmp_nvim_lsp.default_capabilities()

                    vim.lsp.config("*", { capabilities = capabilities, })
              end,
            }
        },
        event = { "BufReadPre", "BufNewFile" }, 
        opts = function()
            local cmp = require('cmp')
            return {
                completion = {
                    autocomplete =false, -- Отключить автоматическое появление, так как сильно грузит Vim
                },
                mapping = {
                    ['<C-Space>'] = cmp.mapping.complete(), -- Вызов меню автокомплита
                    ['<C-e>'] = cmp.mapping.abort(), -- Закрыть меню
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Подтвердить выбор
                    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Навигация вверх
                    ['<C-n>'] = cmp.mapping.select_next_item(), -- Навигация вниз
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp', priority = 1},  -- Источник из LSP
                    { name = 'html-css', priority = 2 },  -- Источник из LSP
                    { name = 'path' },  -- Источник из LSP
                    -- { name = 'luasnip' },  -- Источник из LSP
                }),
            }
        end,
    },-- Autocomplete
}
