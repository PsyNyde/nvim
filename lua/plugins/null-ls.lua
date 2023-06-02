local M = {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    opts = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local code_actions = null_ls.builtins.code_actions
        local completion = null_ls.builtins.completion
        return {
            -- debug = true,
            sources = {
                completion.luasnip,
                -- completion.spell,
                -- formatter
                formatting.shfmt,
                formatting.stylua,
                formatting.prettier.with({
                    filetypes = {
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "vue",
                        "css",
                        "scss",
                        "less",
                        "html",
                        "json",
                        "jsonc",
                        "yaml",
                        "markdown",
                        "markdown.mdx",
                        "graphql",
                        "handlebars",
                        "astro",
                    },
                }),
                formatting.black,
                diagnostics.trail_space,
                -- diagnostics.cspell.with({
                -- 	diagnostics_postprocess = function(diagnostic)
                -- 		diagnostic.severity = vim.diagnostic.severity["WARN"]
                -- 	end,
                -- }),
                code_actions.gitsigns,
                code_actions.eslint,
                -- code_actions.cspell,
            },
        }
    end,
}

return M
