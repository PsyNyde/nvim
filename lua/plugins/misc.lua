-- All plugins are lazy-loaded by default
return {
	{ "nvim-lua/plenary.nvim" },
	{ "max397574/better-escape.nvim", config = true, event = "BufReadPre" },
	{
		"folke/which-key.nvim",
        event = "BufReadPost",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 400
			require("which-key").setup()
		end,
	},
	--{ "MunifTanjim/nui.nvim" }, --
	-- { "nvim-tree/nvim-web-devicons", opts = { default = true } },
}
