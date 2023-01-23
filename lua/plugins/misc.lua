-- All plugins are lazy-loaded by default
return {
	{ "nvim-lua/plenary.nvim" },
	{ "max397574/better-escape.nvim", config = true, event = "BufReadPre" },
	{
		"folke/which-key.nvim",
        lazy = false,
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	--{ "MunifTanjim/nui.nvim" }, --
	-- { "nvim-tree/nvim-web-devicons", opts = { default = true } },
}
