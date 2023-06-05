-- All plugins are lazy-loaded by default
return {
    { "nvim-lua/plenary.nvim" },
    { "kylechui/nvim-surround", config = true, event = "BufReadPost" },
    { "ggandor/leap.nvim", event = "BufReadPost",
        dependencies = {
		{ "tpope/vim-repeat" },
        },
        config = function()
            require('leap').add_default_mappings()
		end,
    },
    {
        "github/copilot.vim",
        keys = {
            {"<leader>ecp", "<cmd>Copilot enable<cr>", desc= "Copilot sucs"},
            {"<leader>dcp", "<cmd>Copilot disable<cr>", desc= "Copilot sucs"},
        }
    },
    { "folke/todo-comments.nvim", event = "BufReadPost", config = true},
    {
        "folke/twilight.nvim",
        cmd = "Twilight",
        keys = {
            { "<leader>ttw", "<cmd>Twilight<cr>", desc = "Toggle twilight" },
        }
    }
}
