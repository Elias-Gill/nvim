return {
    -- Lsp configs
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
            -- Border for all floating windows
            vim.o.winborder = "single"

            -- Diagnostics config
            vim.diagnostic.config({
                float = { border = "single" },
                severity_sort = true,
                source = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.HINT] = " ",
                        [vim.diagnostic.severity.INFO] = " ",
                    },
                },
                virtual_text = {
                    prefix = "",
                    spacing = 1,
                },
                underline = true,
                update_in_insert = true,
            })

            -- Overwrites the floating windows of lsp hover to have a better size
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or "single"
                opts.max_width = opts.max_width or 90
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end
        end
    },
}
