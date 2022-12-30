local M = { 
	"akinsho/bufferline.nvim",
}

function M.config()
	local color = {
		base00 = "#151515",
		base01 = "#1F1F1F",
		base02 = "#2E2E2E",
		base03 = "#424242",
		base04 = "#BBB6B6",
		base05 = "#E8E3E3",
		base06 = "#E8E3E3",
		base07 = "#E8E3E3",
		base08 = "#B66467",
		base09 = "#D9BC8C",
		base0A = "#D9BC8C",
		base0B = "#8C977D",
		base0C = "#8AA6A2",
		base0D = "#8DA3B9",
		base0E = "#A988B0",
		base0F = "#BBB6B6",
	}

	
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
				fg = color.base00,
				bg = color.base00,
			},
			background = {
				fg = color.base03,
				bg = color.base00,
			},

			-- buffers
			buffer_selected = {
				fg = color.base05,
				bg = color.base00,
				italic = false,
			},
			buffer_visible = {
				fg = color.base03,
				bg = color.base00,
			},

			-- close buttons
			close_button = {
				fg = color.base03,
				bg = color.base00,
			},
			close_button_visible = {
				fg = color.base03,
				bg = color.base00,
			},
			close_button_selected = {
				fg = color.base08,
				bg = color.base00,
			},

			indicator_selected = {
				fg = color.base00,
				bg = color.base00,
			},
			-- modified
			modified = {
				fg = color.base03,
				bg = color.base00,
			},
			modified_visible = {
				fg = color.base00,
				bg = color.base00,
			},
			modified_selected = {
				fg = color.base0B,
				bg = color.base00,
			},

			-- tabs
			tab_close = {
				fg = color.base00,
				bg = color.base00,
			},
		},
	}

end

return M
