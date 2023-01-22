require("config.options")
require("config.lazy")
require("config.statusline")

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("config.autocmds")
		require("config.keybinds")
	end,
})
