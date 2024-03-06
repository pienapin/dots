return {
	-- LSP and Completion Stuff
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	'folke/neodev.nvim',
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
	},

	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets',
			'hrsh7th/cmp-nvim-lsp',
		},
	},
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'elkowar/yuck.vim',

	-- Utilities Stuff
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
			-- or                     , branch = '0.1.x',
  	dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim"
		}
	},
	{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
	},
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},
	{
		'm4xshen/autoclose.nvim',
		config = function()
			require('autoclose').setup()
		end
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		-- @type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	},
	{
		'norcalli/nvim-colorizer.lua',
		config = function()
			require'colorizer'.setup()
		end
	},
	{
		'akinsho/bufferline.nvim',
		version = '*',
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function ()
			require('bufferline').setup{}
		end
	},

	-- Appearances Stuff
	{
		'nyoom-engineering/oxocarbon.nvim',
		priority = 1000,
		config = function()
			vim.opt.background = 'dark'
			vim.cmd('colorscheme oxocarbon')
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
	},
	{
		'xiyaowong/transparent.nvim',
		config = function()
			vim.g.transparent_enabled = true
		end
	}
}
