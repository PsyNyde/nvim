local M = {}

M.git_colors = {
	GitAdd = "#A1C281",
	GitChange = "#74ADEA",
	GitDelete = "#FE747A",
}
M.lsp_signs = { Error = "✖ ", Warn = "! ", Hint = " ", Info = " " }

M.cmp_kinds = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
	Copilot = "  ",
}

M.mason_packages = {
	"astro-language-server",
	"bash-language-server",
	-- "cspell",
	"css-lsp",
	"eslint-lsp",
	"html-lsp",
	"json-lsp",
	"markdownlint",
	"prettier",
	"pyright",
	"shfmt",
	"stylua",
	"typescript-language-server",
}

M.lsp_servers = {
	"tsserver",
	"pyright",
	"eslint",
	"bashls",
	"jsonls",
	"cssls",
	"html",
    'astro'
}

M.diagnostics_active = true

function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, buffer)
		end,
	})
end

function M.warn(msg, notify_opts)
	vim.notify(msg, vim.log.levels.WARN, notify_opts)
end

function M.error(msg, notify_opts)
	vim.notify(msg, vim.log.levels.ERROR, notify_opts)
end

function M.info(msg, notify_opts)
	vim.notify(msg, vim.log.levels.INFO, notify_opts)
end

---@param silent boolean?
---@param values? {[1]:any, [2]:any}
function M.toggle(option, silent, values)
	if values then
		if vim.opt_local[option]:get() == values[1] then
			vim.opt_local[option] = values[2]
		else
			vim.opt_local[option] = values[1]
		end
		return require("utils").info("Set " .. option .. " to " .. vim.opt_local[option]:get(), { title = "Option" })
	end
	vim.opt_local[option] = not vim.opt_local[option]:get()
	if not silent then
		if vim.opt_local[option]:get() then
			require("utils").info("Enabled " .. option, { title = "Option" })
		else
			require("utils").warn("Disabled " .. option, { title = "Option" })
		end
	end
end

function M.toggle_diagnostics()
	M.diagnostics_active = not M.diagnostics_active
	if M.diagnostics_active then
		vim.diagnostic.show()
		require("utils").info("Enabled Diagnostics", { title = "Lsp" })
	else
		vim.diagnostic.hide()
		require("utils").warn("Disabled Diagnostics", { title = "Lsp" })
	end
end

return M
