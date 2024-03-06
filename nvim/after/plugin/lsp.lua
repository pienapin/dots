local on_attach = function(_, bufnr)

	vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = bufnr})
	vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { buffer = bufnr})

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
	vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = bufnr })
	vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = bufnr})


	vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })

	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, {})
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason').setup()
require('mason-lspconfig').setup_handlers({
	function(server_name)
		require('lspconfig')[server_name].setup {
			on_attach = on_attach,
			capabilities = capabilities
		}
	end,

	['lua_ls'] = function()
		require('neodev').setup()
		require('lspconfig').lua_ls.setup {
				on_attach = on_attach,
				capabilities = capabilities,
				lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
		}
	end
})
