local M = {
	"goolord/alpha-nvim",
	event = "VimEnter",
}

function M.config()
	local status_ok, alpha = pcall(require, "alpha")
	if not status_ok then
		return
	end

	local dashboard = require("alpha.themes.dashboard")
	-- dashboard.section.header.val = {
	-- 	"⣿⣿⣿⡿⠛⢉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	-- 	"⣿⣿⠋⠄⠈⠁⠄⠄⠄⠄⠄⢀⠄⠄⠄⠄⠄⠄⠄⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	-- 	"⣿⠃⠄⠄⠄⠄⠄⠄⠄⠄⠄⣾⣷⣄⠄⠄⠄⠄⠄⠄⠄⢻⣿⣿⣿⣿⣿⣿⣿⣿ ",
	-- 	"⡇⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⣿⣷⠄⠄⠄⠄⠄⠄⠈⣿⣿⡿⠿⠿⣿⣿⣿ ",
	-- 	"⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣻⣿⣿⣿⣿⣿⣦⠄⠄⠄⠄⠄⢹⣿⠄⢰⣤⠈⣿⣿ ",
	-- 	"⠄⠄⠄⠄⠄⠄⠄⢰⠄⣾⣿⣿⣿⣿⣿⣿⡿⢢⡇⠄⠄⠄⠈⣿⡶⠚⠉⢀⣿⣿ ",
	-- 	"⠄⠄⠄⠄⠄⠄⠄⢸⡏⢸⣿⣿⣿⣿⣿⣿⡇⠄⣿⠄⠄⠄⠄⣿⡁⢰⣿⣿⣿⣿ ",
	-- 	"⠄⠄⠄⠄⠄⠄⠄⢸⡇⠄⢿⣿⣿⣿⣿⣿⣿⠄⣿⡇⠄⠄⠄⢻⣿⣿⣿⣿⣿⣿ ",
	-- 	"⠄⠄⠄⣀⠄⠄⠄⢸⣿⠄⠸⣿⣿⣿⣿⣿⣿⣀⣿⣧⠄⠄⠄⠸⣿⣿⣿⣿⣿⣿ ",
	-- 	"⠄⠄⠄⢏⡀⠄⠄⢸⣿⣷⣴⣿⣿⣿⣿⣿⣿⣿⣿⣹⠄⠄⢀⠄⢻⣿⣿⣿⣿⣿ ",
	-- 	"⡀⠄⣤⡈⠓⠄⠄⠘⣿⣿⣿⣿⣿⣿⡿⢿⣿⣿⡿⠃⠄⠄⢸⣧⠄⢻⣿⣿⣿⣿ ",
	-- 	"⣷⣤⣿⣿⣿⡆⠄⠄⠄⢈⠉⠛⠛⠓⠒⠛⠋⠁⣤⡞⠄⠄⣾⣿⣷⣄⠙⣿⣿⣿ ",
	-- 	"⣿⣿⣿⣿⣿⠿⠄⠄⢰⢸⣆⠲⣦⣄⡀⣠⣿⣤⣌⠃⠄⢠⣿⣿⣿⣿⣿⣿⣿⣿ ",
	-- 	"⣿⣿⣿⠟⠁⠄⠄⢆⠄⠈⣿⣿⣾⢏⡱⣿⡏⣿⣿⠄⠄⠘⢿⣿⣿⣿⣿⣿⣿⣿ ",
	-- 	"⣿⣿⠃⠄⠄⠄⠄⠄⠄⠄⢈⣋⣵⣿⣿⣶⡾⠟⠁⠄⠄⠄⠄⢻⣿⣿⣿⣿⣿⣿",
	-- }
	-- dashboard.section.header.val = {
	-- 	"			⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⠀⠀⠀⣀⣄⠀",
	-- 	"⠀⠀⠀⠀⠀⠀⠈⡿⠻⠷⠶⣦⣤⣀⠀⢀⡠⠞⠋⠀⣿⣠⠴⠖⢒⣦⠶⠚⠋⠁⣉⢳⡀⠀⠀⠀⠀⠀",
	-- 	"⠀⠀⠀⠀⠀⠀⢠⠇⠀⡖⠦⢤⣀⡉⠙⠋⠀⠀⠀⠈⠉⠀⠀⠠⠞⠋⠀⠠⣞⠋⢹⠀⡇⠀⠀⠀⠀⠀",
	-- 	"⠀⠀⠀⠀⠀⠀⡏⠀⠀⡇⠀⣀⡖⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⠚⠀⣿⠀⠀⠀⠀⠀",
	-- 	"⠀⠀⠀⠀⠀⣼⠁⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡆⠀⠀⠀⠀",
	-- 	"⠀⠀⠀⠀⢠⡟⠂⠀⠀⠀⠀⠀⠀⠀⣴⣶⣄⠀⠀⠀⠀⠀⠀⣖⣶⡄⠀⠀⠀⠀⠀⠀⠀⡏⢦⣀⠀⠀",
	-- 	"⠀⠀⣠⡖⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⣯⣹⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠇⠀⠉⢷⡆",
	-- 	"⢶⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣛⡻⠀⠀⢀⣤⣄⠀⠙⠿⠋⠀⠀⠀⠀⠀⠀⠀⣀⣀⡤⠾⠃",
	-- 	"⠀⠉⠓⢦⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⢤⡀⠀⠀⠀⣀⣀⣀⡀⠀⣠⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⡄⠀⠀",
	-- 	"⠀⠀⠀⠀⣴⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠒⠚⠁⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠭⠃⠀",
	-- 	"⠀⠀⣠⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠤⢤⡤⠴⠶⠊⠉⠉⠁⠀⠀⠀⠀",
	-- 	"⠀⠀⠙⠓⠒⢺⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢆⣀⠀⠀⠀⠀⠀⠀⠀⠀",
	-- 	"⠀⠀⢀⣀⣠⠞⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡤⠚⠃⠀⠀⠀⠀⠀⠀⠀",
	-- 	"⠐⠛⠋⠉⠁⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	-- 	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀hewo!! <3:",
	-- }
	--
	dashboard.section.header.val = {
		"⣿⣿⣿⣿⣯⣿⣿⠄⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠈⣿⣿⣿⣿⣿⣿⣆⠄",
		"⢻⣿⣿⣿⣾⣿⢿⣢⣞⣿⣿⣿⣿⣷⣶⣿⣯⣟⣿⢿⡇⢃⢻⣿⣿⣿⣿⣿⢿⡄",
		"⠄⢿⣿⣯⣏⣿⣿⣿⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣧⣾⢿⣮⣿⣿⣿⣿⣾⣷",
		"⠄⣈⣽⢾⣿⣿⣿⣟⣄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣝⣯⢿⣿⣿⣿⣿",
		"⣿⠟⣫⢸⣿⢿⣿⣾⣿⢿⣿⣿⢻⣿⣿⣿⢿⣿⣿⣿⢸⣿⣼⣿⣿⣿⣿⣿⣿⣿",
		"⡟⢸⣟⢸⣿⠸⣷⣝⢻⠘⣿⣿⢸⢿⣿⣿⠄⣿⣿⣿⡆⢿⣿⣼⣿⣿⣿⣿⢹⣿",
		"⡇⣿⡿⣿⣿⢟⠛⠛⠿⡢⢻⣿⣾⣞⣿⡏⠖⢸⣿⢣⣷⡸⣇⣿⣿⣿⢼⡿⣿⣿",
		"⣡⢿⡷⣿⣿⣾⣿⣷⣶⣮⣄⣿⣏⣸⣻⣃⠭⠄⠛⠙⠛⠳⠋⣿⣿⣇⠙⣿⢸⣿",
		"⠫⣿⣧⣿⣿⣿⣿⣿⣿⣿⣿⣿⠻⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣹⢷⣿⡼⠋",
		"⠄⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⣿⠄⠄",
		"⠄⠄⢻⢹⣿⠸⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣼⣿⣿⣿⣿⡟⠄⠄",
		"⠄⠄⠈⢸⣿⠄⠙⢿⣿⣿⣹⣿⣿⣿⣿⣟⡃⣽⣿⣿⡟⠁⣿⣿⢻⣿⣿⢿⠄⠄",
		"⠄⠄⠄⠘⣿⡄⠄⠄⠙⢿⣿⣿⣾⣿⣷⣿⣿⣿⠟⠁⠄⠄⣿⣿⣾⣿⡟⣿⠄⠄",
		"⠄⠄⠄⠄⢻⡇⠸⣆⠄⠄⠈⠻⣿⡿⠿⠛⠉⠄⠄⠄⠄⢸⣿⣇⣿⣿⢿⣿⠄⠄",
	}

	dashboard.section.buttons.val = {
		dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
		dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
		dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
		dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
		dashboard.button("q", " " .. " Quit", ":qa<CR>"),
	}
	-- local function footer()
	-- 	return "~wahid@orbit~"
	-- end
	--
	-- dashboard.section.footer.val = footer()
	--
	dashboard.section.footer.opts.hl = "Type"
	dashboard.section.header.opts.hl = "Include"
	dashboard.section.buttons.opts.hl = "Keyword"
	dashboard.opts.opts.noautocmd = true
	alpha.setup(dashboard.opts)
	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		callback = function()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			dashboard.section.footer.val = "⚡loaded " .. stats.count .. " plugins in " .. ms .. "ms"
			pcall(vim.cmd.AlphaRedraw)
		end,
	})
end

return M
