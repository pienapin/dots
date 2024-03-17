require('bufferline').setup({
	options = {
		mode = 'buffers',
		diagnostics = 'nvim_lsp',
		offsets = {
			{
				filetype = 'neo-tree',
				text = 'NeoTree',
				highlight = 'Directory',
				separator = true
			}
		},
	}
})

vim.keymap.set('n', ']', '<Cmd>:BufferLineCycleNext<CR>', { nowait = true } )
vim.keymap.set('n', '[', '<Cmd>:BufferLineCyclePrev<CR>', { nowait = true } )
vim.keymap.set('n', '<leader>b', '<Cmd>:BufferLinePick<CR>', { nowait = true } )
