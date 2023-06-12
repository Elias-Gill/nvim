return {
    { "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        config = function()
            require('lsp_signature').setup({
                bind = false,
                floating_window = false,
                floating_window_above_cur_line = false,
                noice = false, -- render markdown
                hint_enable = true,
                hint_prefix = "🐼 ",
                hint_scheme = "String",
                -- hi_parameter = "LspSignatureActiveParameter",
                hi_parameter = "IncSearch",
                handler_opts = {
                    border = "single" -- double, rounded, single, shadow, none, or a table of borders
                },
                always_trigger = true,
                transparency = nil,
            })
        end
    },
}
