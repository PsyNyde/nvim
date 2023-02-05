local M = {
	"nvim-telescope/telescope.nvim",
	event = "BufReadPre",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
	},
	keys = {

		{ "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files" },
		{ "<C-p>", "<cmd>lua require('telescope.builtin').commands()<cr>" },
		{
			"<C-M-p>",
			"<cmd>lua require('telescope.builtin').builtin(require('telescope.themes').get_dropdown({}))<cr>",
		},
		{ "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Find word" },
		{ "<C-f>", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>" },
		{ "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Find buffer" },
	},
	cmd = { "Telescope", "Tel" },
	opts = function()
		local actions = require("telescope.actions")
		local theme = require("telescope.themes")
		return {
			pickers = {
				find_files = { hidden = false },
				live_grep = {
					additional_args = function(opts)
						return { "--hidden" }
					end,
				},
			},
			defaults = {
				mappings = { i = { ["<esc>"] = actions.close } },
				file_ignore_patterns = {
					"%.jpg",
					"%.jpeg",
					"%.webp",
					"%.png",
					"%.gif",
					"%.otf",
					"%.ttf",
					"node_modules",
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				layout_strategy = "horizontal",
			},

			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				["ui-select"] = {
					theme.get_dropdown({
						-- even more opts
					}),
				},
				file_browser = {
					grouped = true,
					hidden = true,
					hijack_netrw = true,
					respect_gitignore = false,
				},
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("file_browser")
	end,
}

return M
