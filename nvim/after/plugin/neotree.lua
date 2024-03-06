require('neo-tree').setup({
	filesystem = {
		follow_current_file = {
			enabled = true,
		},
		filtered_items = {
			visible = true,
			show_hidden_count = true,
			hide_dotfiles = false,
			hide_gitignored = false
		}
	},
	window = {
		width = 22,
	}
})

vim.keymap.set('n', '<leader>oe', '<Cmd>Neotree toggle position=left<CR>')
vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle position=float<CR>')
