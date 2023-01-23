local utils = require("utils")

-- Remap command key
vim.keymap.set("n", "<leader><leader>", ":", { desc = "Command mode" })
-- Essential
vim.keymap.set({ "n", "v" }, "<leader>qq", "<cmd>quitall<cr>", { desc = "Quit" })
vim.keymap.set({ "n", "i", "v" }, "<C-w>", "<cmd>bd<cr>", { desc = "Quit buffer" })
vim.keymap.set({ "i", "v", "n" }, "<C-M-w>", "<cmd>bd!<cr><esc>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Open lazy" })
vim.keymap.set("n", "<leader>uu", "<cmd>Lazy sync<cr>", { desc = "Sync plugins" })

-- Normal Map
vim.keymap.set("n", "<TAB>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-TAB>", ":bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "hs", ":split<CR>", { desc = "Horizonal split" })
vim.keymap.set("n", "vs", ":vs<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<C-a>", "ggVG<CR>", { desc = "Select all" })

-- Move lines
vim.keymap.set("n", "<C-M-j>", ":m .+1<CR>==", { desc = "Move down" })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("i", "<C-M-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("n", "<C-M-k>", ":m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move up" })
vim.keymap.set("i", "<C-M-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- Terminal
vim.keymap.set("n", "<leader>v", ":vs +terminal | startinsert<CR>", { desc = "Vertical terminal" })
vim.keymap.set("n", "<leader>h", ":split +terminal | startinsert<CR>", { desc = "Horizontal terminal" })

-- save file
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Insert Map
vim.keymap.set("i", "<C-E>", "<End>", { desc = "End of line" })
vim.keymap.set("i", "<C-A>", "<Home>", { desc = "Beginning of line" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', { desc = "Copy line to clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete to void" })

-- Replace Map
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Replace word" })

-- Clear search results
vim.keymap.set("n", "<esc>", "<cmd>noh<CR>")

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Lsp formatting
vim.keymap.set("n", "<C-M-f>", function()
	vim.lsp.buf.format({ async = false })
	vim.api.nvim_command("write")
end, { desc = "Lsp formatting" })

-- Open quickfix list
vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.setloclist()
end, { desc = "Open quickfix list" })

-- toggle options
vim.keymap.set("n", "<leader>tw", function()
	utils.toggle("wrap")
end, { desc = "Toggle Word Wrap" })
vim.keymap.set("n", "<leader>ts", function()
	utils.toggle("spell")
end, { desc = "Toggle Spelling" })
vim.keymap.set("n", "<leader>tl", function()
	utils.toggle("relativenumber")
end, { desc = "Toggle Line Numbers" })
vim.keymap.set("n", "<leader>td", utils.toggle_diagnostics, { desc = "Toggle Diagnostics" })
vim.keymap.set("n", "<leader>tc", "<cmd>ColorizerToggle<cr>", { desc = "Toggle colorizer" })
