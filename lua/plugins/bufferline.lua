local M = {
	"akinsho/bufferline.nvim",
	event = "BufReadPost",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", opts = { default = true }, event = "BufReadPost" },
	},
}

function M.config()
	local bufferline = require("bufferline")
	bufferline.setup({
		options = {
			numbers = "none",
			offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
			buffer_close_icon = "",
			modified_icon = "",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 18,
			max_prefix_length = 15,
			tab_size = 20,
			show_tab_indicators = true,
			enforce_regular_tabs = false,
			view = "multiwindow",
			show_buffer_close_icons = true,
			separator_style = "thin",
			always_show_bufferline = true,
			diagnostics = "nvim_lsp",
		},
	})
end

return M
