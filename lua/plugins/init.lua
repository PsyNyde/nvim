return {
	{
		"tpope/vim-fugitive",
		event = "VeryLazy"
	}, 
	{
		"norcalli/nvim-colorizer.lua",
		config = true
	}, 
	{
		"windwp/nvim-autopairs",
		config = true
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
