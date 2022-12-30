fn = vim.fn
api = vim.api
cmd = vim.cmd
opt = vim.opt
g = vim.g

local modules = {
  'options',
  'keybinds',
  'lazy_bootstrap',
  'statusline',
}

for _, a in ipairs(modules) do
  local ok, err = pcall(require, a)
  if not ok then
    error("Error calling " .. a .. err)
  end
end

require("lazy").setup("plugins")

-- Auto commands
api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  command = "setlocal nonumber norelativenumber signcolumn=no | setfiletype terminal",
})
