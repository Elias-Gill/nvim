return {
    -- signature help
    { "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        config = function()
            require('lsp_signature').setup({
                bind = true,
                floating_window = false,
                floating_window_above_cur_line = true,
                noice = true, -- render markdown
                hint_enable = true,
                hint_prefix = "🐼 ",
                hint_scheme = "String",
                hi_parameter = "LspSignatureActiveParameter",
                handler_opts = {
                    border = "single" -- double, rounded, single, shadow, none, or a table of borders
                },
                always_trigger = true,
                transparency = nil,
            })
        end
    },
}
