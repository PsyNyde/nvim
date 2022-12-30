return {
	{
		"tpope/vim-fugitive",
		event = "VeryLazy"
	}, 
	{
		"norcalli/nvim-colorizer.lua",
		config = true,
		event = "BufReadPre"
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufReadPre",
		config = true,
	},
	{
		"windwp/nvim-autopairs",
		config = true,
		event = "BufReadPre"
	}, 
	{"nvim-tree/nvim-web-devicons"}, 
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = true
	}, 
	{"williamboman/mason-lspconfig.nvim"}, 
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end
	},
}
