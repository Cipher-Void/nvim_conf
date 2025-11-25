vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, noremap = true, silent = true }

        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)

        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end
})

vim.diagnostic.config({
	underline = false,
	update_in_insert = false,
	signs = true, 
	severity_sort = true,
	virtual_text = false,  -- Для того чтобы ошибка писалась справа(по умолчанию выключено)
	-- virtual_text = {
	-- 	spacing = 4,
	-- 	source = "if_many",
	-- 	prefix = '●',
	-- }
})

vim.lsp.enable({
    "html",
    "cssls",
    "lua_ls",
    "emmet_ls",
    "pyright",
})
