local cmdline = false
local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-emoji",
		{ "hrsh7th/cmp-cmdline", enabled = cmdline },
		{ "dmitmel/cmp-cmdline-history", enabled = cmdline },
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
	},
}

function M.config()
	vim.o.completeopt = "menuone,noselect"

	local kind_icons = {
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "",
		Event = "",
		Operator = "",
		TypeParameter = ""
	}

	-- Setup nvim-cmp.
	local cmp = require("cmp")
	cmp.setup({
		snippet = {
			expand = function(args)
				local present, luasnip = pcall(require, "luasnip")
				if present then
					luasnip.lsp_expand(args.body)
				end
			end,
		},
		window = {
			completion = { border = "solid" },
			documentation = { border = "solid" }
		},
		mapping = cmp.mapping.preset.insert({
			['<C-Space>'] = cmp.mapping.complete(),
			['<Esc>'] = cmp.mapping.abort(),
			['<CR>'] = cmp.mapping.confirm(),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { "i", "s" }),

		}),
		formatting = {
			format = function(entry, vim_item)
				vim_item.kind = kind_icons[vim_item.kind]
				vim_item.menu = ({
					-- buffer = "[Buf]",
					-- path = "[Path]",
					-- nvim_lsp = "[Lsp]",
					-- luasnip = "[Snip]",
					-- cmdline = "[Cmd]",
					-- nvim_lua = "[Lua]",
				})[entry.source.name]
				return vim_item
			end,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "emoji" },
		}),
		-- experimental = {
		-- 	ghost_text = {
		-- 		hl_group = "LspCodeLens",
		-- 	},
		-- },
	})

	cmp.setup.cmdline('/', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})

	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		})
	})
end

return M
