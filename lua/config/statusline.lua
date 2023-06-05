local modes = {
	["n"] = " ",
	["no"] = " ",
	["nov"] = " ",
	["noV"] = " ",
	["no"] = " ",
	["niI"] = " ",
	["niR"] = " ",
	["niV"] = " ",

	["i"] = " ",
	["ic"] = " ",
	["ix"] = " ",
	["s"] = " ",
	["S"] = " ",

	["v"] = " ",
	["V"] = " ",
	[""] = " ",
	["r"] = "﯒ ",
	["r?"] = " ",
	["c"] = " ",
	["t"] = " ",
	["!"] = " ",
	["R"] = " ",
}

local function color()
	local mode = vim.api.nvim_get_mode().modesta
	local mode_color = "%#StatusLine#"
	if mode == "n" then
		mode_color = "%#StatusNormal#"
	elseif mode == "i" or mode == "ic" then
		mode_color = "%#StatusInsert#"
	elseif mode == "v" or mode == "V" or mode == "" then
		mode_color = "%#StatusVisual#"
	elseif mode == "R" then
		mode_color = "%#StatusReplace#"
	elseif mode == "c" then
		mode_color = "%#StatusCommand#"
	elseif mode == "t" then
		mode_color = "%#StatusTerminal#"
	end
	return mode_color
end

local function branch()
	local cmd = io.popen("git branch --show-current 2>/dev/null")
	local branch = cmd:read("*l") or cmd:read("*a")
	cmd:close()
	if branch ~= "" then
        return "  " .. branch
	else
		return ""
	end
end

local function get_current_file_name()
    local file = vim.fn.expand("%:t")
    if vim.fn.empty(file) == 1 then
        return ""
    end
    local icon = require("nvim-web-devicons").get_icon(
        vim.fn.expand("%:e"),
        vim.fn.expand("%:t"),
        { default = true }
    )
    return icon .. " " .. file .. " "
end

-- git changes function
local function git_changes()
    local git_status = vim.b.gitsigns_status_dict
    if git_status then
        local added = git_status.added
        local changed = git_status.changed
        local removed = git_status.removed
        local staged = git_status.staged
        local unmerged = git_status.unmerged
        local renamed = git_status.renamed
        local deleted = git_status.deleted
        local untracked = git_status.untracked
        local ignored = git_status.ignored
        local branch = git_status.head
        local status = {}
        if added and added > 0 then
            table.insert(status, " " .. added)
        end
        if changed and changed > 0 then
            table.insert(status, " " .. changed)
        end
        if removed and removed > 0 then
            table.insert(status, " " .. removed)
        end
        if staged and staged > 0 then
            table.insert(status, " " .. staged)
        end
        if unmerged and unmerged > 0 then
            table.insert(status, " " .. unmerged)
        end
        if renamed and renamed > 0 then
            table.insert(status, " " .. renamed)
        end
        if deleted and deleted > 0 then
            table.insert(status, " " .. deleted)
        end
        if untracked and untracked > 0 then
            table.insert(status, " " .. untracked)
        end
        if ignored and ignored > 0 then
            table.insert(status, " " .. ignored)
        end
        if #status > 0 then
            return " " .. table.concat(status, " ")
        end
    end
    return ""
end

-- file encoding function
local function file_encoding()
    local encoding = vim.bo.fenc ~= "" and vim.bo.fenc or vim.o.enc
    return " " .. encoding .. " "
end

-- StatusLine Modes
Status = function()
	return table.concat({
		color(), -- mode colors
		string.format(" %s", modes[vim.api.nvim_get_mode().mode]):upper(), -- mode
		"%#StatusActive#", -- middle color
		branch(),
        git_changes(),
		"%=", -- right align
        file_encoding(),
        get_current_file_name(),
		color(), -- mode colors
		"%l:%c ", -- line, column
	})
end

-- Execute statusline
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	pattern = "*",
	command = "setlocal statusline=%!v:lua.Status()",
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	pattern = "*",
	command = "setlocal statusline=%#StatusLine#",
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave", "WinEnter", "BufEnter", "FileType" }, {
	pattern = { "NvimTree*", "terminal" },
	command = "setlocal statusline=%#StatusNormal#",
})
