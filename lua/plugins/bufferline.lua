local M = {
    "akinsho/bufferline.nvim",
    event = "BufReadPost",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", opts = { default = true }, event = "BufReadPost" },
    },
}

function M.config()
    local bufferline = require("bufferline")
    bufferline.setup({
        options = {
            numbers = "none",
            offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
            buffer_close_icon = "",
            modified_icon = "",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 18,
            max_prefix_length = 15,
            tab_size = 20,
            show_tab_indicators = true,
            enforce_regular_tabs = false,
            view = "multiwindow",
            show_buffer_close_icons = true,
            separator_style = "thin",
            always_show_bufferline = true,
            diagnostics = "nvim_lsp",
        },
        highlights = {
            fill = {
                fg = _G.color.base00,
                bg = _G.color.base00,
            },
            background = {
                fg = _G.color.base03,
                bg = _G.color.base00,
            },

            -- buffers
            buffer_selected = {
                fg = _G.color.base05,
                bg = _G.color.base00,
                italic = true,
            },
            buffer_visible = {
                fg = _G.color.base03,
                bg = _G.color.base00,
            },

            -- close buttons
            close_button = {
                fg = _G.color.base03,
                bg = _G.color.base00,
            },
            close_button_visible = {
                fg = _G.color.base03,
                bg = _G.color.base00,
            },
            close_button_selected = {
                fg = _G.color.base08,
                bg = _G.color.base00,
            },

            indicator_selected = {
                fg = _G.color.base08,
                bg = _G.color.base00,
            },
            -- modified
            modified = {
                fg = _G.color.base03,
                bg = _G.color.base00,
            },
            modified_visible = {
                fg = _G.color.base00,
                bg = _G.color.base00,
            },
            modified_selected = {
                fg = _G.color.base0B,
                bg = _G.color.base00,
            },

            -- tabs
            tab_close = {
                fg = _G.color.base03,
                bg = _G.color.base00,
            },
            -- -- Numbers
            numbers = {
                fg = _G.color.base03,
                bg = _G.color.base00,
            },
            separator = {
                fg = _G.color.base00,
                bg = _G.color.base00,
            },
            diagnostic = {
                bg = _G.color.base00,
            },
            diagnostic_visible = {
                bg = _G.color.base00,
            },
            diagnostic_selected = {
                bg = _G.color.base00,
            },
            hint = {
                bg = _G.color.base00,
            },
            hint_visible = {
                bg = _G.color.base00,
            },
            hint_selected = {
                bg = _G.color.base00,
            },
            hint_diagnostic = {
                bg = _G.color.base00,
            },
            hint_diagnostic_visible = {
                bg = _G.color.base00,
            },
            hint_diagnostic_selected = {
                bg = _G.color.base00,
            },
            info = {
                bg = _G.color.base00,
            },
            info_visible = {
                bg = _G.color.base00,
            },
            info_selected = {
                bg = _G.color.base00,
            },
            info_diagnostic = {
                bg = _G.color.base00,
            },
            info_diagnostic_visible = {
                bg = _G.color.base00,
            },
            info_diagnostic_selected = {
                bg = _G.color.base00,
            },
            warning = {
                bg = _G.color.base00,
            },
            warning_visible = {
                bg = _G.color.base00,
            },
            warning_selected = {
                bg = _G.color.base00,
            },
            warning_diagnostic = {
                bg = _G.color.base00,
            },
            warning_diagnostic_visible = {
                bg = _G.color.base00,
            },
            warning_diagnostic_selected = {
                bg = _G.color.base00,
            },
            error = {
                bg = _G.color.base00,
            },
            error_visible = {
                bg = _G.color.base00,
            },
            error_selected = {
                bg = _G.color.base00,
            },
            error_diagnostic = {
                bg = _G.color.base00,
            },
            error_diagnostic_visible = {
                bg = _G.color.base00,
            },
            error_diagnostic_selected = {
                bg = _G.color.base00,
            },
        },
    })
end

return M
