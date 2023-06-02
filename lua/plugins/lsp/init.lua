local M = {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function(_, opts)
		local utils = require("utils")
		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")
		local lsp_utils = require("plugins.lsp.lsp-utils")
		lsp_utils.setup()

		mason_lspconfig.setup({
			ensure_installed = utils.lsp_servers,
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					on_attach = lsp_utils.on_attach,
					capabilities = lsp_utils.capabilities,
				})
			end,
                -- these are for only ovveriding options
			-- ["pyright"] = function()
			-- 	lspconfig.pyright.setup({
			-- 		settings = {
			-- 			python = {
			-- 				analysis = {
			-- 					typeCheckingMode = "off",
			-- 				},
			-- 			},
			-- 		},
			-- 	})
			-- end,
		})
	end,
}

return M
