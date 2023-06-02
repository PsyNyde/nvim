local M = {
	"mountain-theme/vim",
    name = "mountain",
	lazy = false,
	priority = 1000,
    config = function()
      vim.cmd([[colorscheme mountain]])
    end,
}
return M
