return {
    {
        "hrsh7th/cmp-nvim-lsp",
        config = function()
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            -- used to enable autocompletion (assign to every lsp server config)
            local capabilities = cmp_nvim_lsp.default_capabilities()

            vim.lsp.config("*", { capabilities = capabilities, })
      end,
    },
    {
        'L3MON4D3/LuaSnip', 
        bild = "make install_jsregexp",
        opts = {
            history = true,
            updateevents = "TextChanged,TextChangedI"
        },
        config = function(_, opts)
            local ls = require("luasnip")
            opts.expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
            ls.setup(opts)

            require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })

            -- ваши маппинги для expand/jump
            -- vim.keymap.set({"i", "s"}, "<Tab>", function()
            vim.keymap.set({"i", "s"}, "<A-j>", function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true })

            -- vim.keymap.set({"i", "s"}, "<S-Tab>", function()
            vim.keymap.set({"i", "s"}, "<A-k>", function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end, { silent = true })
            
        end,
    },
    {
        'hrsh7th/nvim-cmp', 
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            'L3MON4D3/LuaSnip', 
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-path",
        },
        event = "VeryLazy", 
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
                    { name = 'luasnip' },  -- Источник из LSP
                }),
            }
        end,
    },-- Autocomplete
}
