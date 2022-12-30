local M = {
	"nvim-tree/nvim-tree.lua"
}

function M.config()
	local ok, nvim_tree = pcall(require, "nvim-tree")
	if not ok then
		return
	end

	nvim_tree.setup {
		view = {
			width = 30,
			side = "left",
			hide_root_folder = true,
		},
		disable_netrw = true,
		hijack_cursor = true,
		update_cwd = true,
		renderer = {
			indent_markers = {
				enable = true,
			},
			icons = {
				webdev_colors = false,
				show = {
					file = false,
					folder = true,
					folder_arrow = false,
					git = true,
				},
			},
		},
		hijack_directories = {
			enable = true,
			auto_open = true,
		},
		git = {
			enable = true,
			ignore = false,
			timeout = 400,
		},
	}


end

return M
