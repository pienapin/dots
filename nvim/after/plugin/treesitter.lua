require('nvim-treesitter.configs').setup {
	ensure_installed = { 'vim', 'vimdoc', 'lua', 'cpp', 'python' },
	auto_install = true,
	sync_install = true,
	ignore_install = {},
	modules = {},
	highlight = { enable = true },
	indent = { enable = true },
}
