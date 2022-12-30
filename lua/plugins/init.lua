return {{"tpope/vim-fugitive"}, {"tpope/vim-surround"}, {
    "norcalli/nvim-colorizer.lua",
    config = true
}, {
    "windwp/nvim-autopairs",
    config = true
}, {"nvim-tree/nvim-web-devicons"}, {
    "folke/which-key.nvim",
    lazy = false
}, {"williamboman/mason-lspconfig.nvim"}, {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
        vim.g.startuptime_tries = 10
    end
}}
