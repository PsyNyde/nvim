local M = {
	'RRethy/nvim-base16',
	lazy = false,
	priority = 1000,
}

function M.config()
	_G.color = {
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
	local present, base16 = pcall(require, "base16-colorscheme")
	-- local base16 =  require("base16-colorscheme")
	if present then
		base16.setup(_G.color)
	end
	-- Highlights 
	local function hl(highlight, fg, bg)
		if fg == nil then fg = "none" end
		if bg == nil then bg = "none" end
		vim.cmd("hi " .. highlight .. " guifg=" .. fg .. " guibg=" .. bg)
	end

	-- Status Line
	hl("StatusNormal")
	hl("StatusLineNC", _G.color.base03)
	hl("StatusActive", _G.color.base05)
	hl("StatusLine", _G.color.base02) -- inactive
	hl("StatusReplace", _G.color.base08)
	hl("StatusInsert", _G.color.base0B)
	hl("StatusCommand", _G.color.base0A)
	hl("StatusVisual", _G.color.base0D)
	hl("StatusTerminal", _G.color.base0E)

	-- Nvim Tree
	hl("NvimTreeFolderName", _G.color.base05)
	hl("NvimTreeOpenedFolderName",_G.color.base05)
	hl("NvimTreeEmptyFolderName", _G.color.base05)
	hl("NvimTreeFolderIcon",_G.color.base03)
	hl("NvimTreeGitDirty", _G.color.base08)
	hl("NvimTreeGitNew", _G.color.base0B)
	hl("NvimTreeGitDeleted",_G.color.base08)
	hl("NvimTreeGitRenamed", _G.color.base0A)
	hl("NvimTreeGitExecFile", _G.color.base0B)
	hl("NvimTreeSpecialFile", _G.color.base0E)
	hl("NvimTreeImageFile", _G.color.base0C)
	hl("NvimTreeWindowPicker", _G.color.base05, _G.color.base01)
	hl("NvimTreeIndentMarker", _G.color.base03)

	-- Telescope
	hl("TelescopePromptBorder", _G.color.base01, _G.color.base01)
	hl("TelescopePromptNormal", nil, _G.color.base01)
	hl("TelescopePromptPrefix", _G.color.base08, _G.color.base01)
	hl("TelescopeSelection", nil, _G.color.base01)


	-- Menu
	hl("Pmenu", nil, _G.color.base01)
	hl("PmenuSbar", nil, _G.color.base01)
	hl("PmenuThumb", nil, _G.color.base01)
	hl("PmenuSel", nil, _G.color.base02)

	-- CMP
	hl("CmpItemAbbrMatch", _G.color.base05)
	hl("CmpItemAbbrMatchFuzzy", _G.color.base05)
	hl("CmpItemAbbr", _G.color.base03)
	hl("CmpItemKind", _G.color.base0E)
	hl("CmpItemMenu", _G.color.base0E)
	hl("CmpItemKindSnippet", _G.color.base0E)

	-- Number
	hl("CursorLine")
	hl("CursorLineNR")
	hl("LineNr", _G.color.base03)

	-- Others
	hl("VertSplit", _G.color.base01, nil)
	hl("NormalFloat", nil, _G.color.base01)
	hl("FloatBorder", _G.color.base01, _G.color.base01)

	-- Extra
	vim.cmd("hi StatusLine gui=strikethrough")
end

return M
