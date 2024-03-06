require('telescope').setup(
	{
		defaults = {
			layout_strategy = 'vertical',
			layout_config = { height = 0.95 },
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = 'smart_case',
			},


			file_browser = {
				depth = 3,
				auto_depth = true,
			},
		}
	}
)

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fr', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', 'gr', builtin.lsp_references)
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols)
vim.keymap.set('n', '<leader>S', builtin.lsp_dynamic_workspace_symbols)

vim.keymap.set(
  "n",
  "<leader>fb",
  ":Telescope file_browser<CR>",
  { noremap = true }
)
