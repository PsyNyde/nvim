local function map(mode, keys, command)
  api.nvim_set_keymap(mode, keys, command, { noremap = true, silent = true })
end
vim.g.mapleader = " "

-- Normal Map
map("n", "<TAB>", ":bnext<CR>")
map("n", "<S-TAB>", ":bprev<CR>")
map("n", "hs", ":split<CR>")
map("n", "vs", ":vs<CR>")

-- Insert Map
map("i", "jk", "<ESC>")

-- Visual Map
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Terminal
map("n", "<leader>v", ":vs +terminal | startinsert<CR>")
map("n", "<leader>h", ":split +terminal | startinsert<CR>")

-- Save
map("i", "<C-S>", "<ESC>:w<CR><Insert>")
map("n", "<C-S>", ":w<CR>")

-- Insert Map
map("i", "<C-E>", "<End>")
map("i", "<C-A>", "<Home>")

-- Nvim-tree
map("n", "<leader>n", ":NvimTreeToggle<CR>")

-- next greatest remap ever : asbjornHaland
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")

map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")

-- Replace Map
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

