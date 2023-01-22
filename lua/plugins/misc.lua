-- All plugins are lazy-loaded by default
return {
	{ "nvim-lua/plenary.nvim" },
	{ "max397574/better-escape.nvim", config = true, event = "BufReadPre" },
	--{ "MunifTanjim/nui.nvim" }, --
	-- { "nvim-tree/nvim-web-devicons", opts = { default = true } },
}
