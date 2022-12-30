local M = { 
	"akinsho/bufferline.nvim",
}

function M.config()
	local ok, bufferline = pcall(require, "bufferline")
	if not ok then
		return
	end
	bufferline.setup {
		options = {
			offsets = { { filetype = "NvimTree", text = "" } },
			separator_style = { "", ""},
			show_tab_indicators = false,
		},
		highlights = {
			fill = {
				fg = _G.color.base00,
				bg = _G.color.base00,
			},
			background = {
				fg = _G.color.base03,
				bg = _G.color.base00,
			},

			-- buffers
			buffer_selected = {
				fg = _G.color.base05,
				bg = _G.color.base00,
				italic = false,
			},
			buffer_visible = {
				fg = _G.color.base03,
				bg = _G.color.base00,
			},

			-- close buttons
			close_button = {
				fg = _G.color.base03,
				bg = _G.color.base00,
			},
			close_button_visible = {
				fg = _G.color.base03,
				bg = _G.color.base00,
			},
			close_button_selected = {
				fg = _G.color.base08,
				bg = _G.color.base00,
			},

			indicator_selected = {
				fg = _G.color.base00,
				bg = _G.color.base00,
			},
			-- modified
			modified = {
				fg = _G.color.base03,
				bg = _G.color.base00,
			},
			modified_visible = {
				fg = _G.color.base00,
				bg = _G.color.base00,
			},
			modified_selected = {
				fg = _G.color.base0B,
				bg = _G.color.base00,
			},

			-- tabs
			tab_close = {
				fg = _G.color.base00,
				bg = _G.color.base00,
			},
		},
	}

end

return M
