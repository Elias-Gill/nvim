return {
    -- Lsp configs
    {
        "neovim/nvim-lspconfig",
        event = "VimEnter",
        config = function()
            require("elias.lsp.lsp_servers")
            require("elias.lsp.lsp-visuals")
        end,
        dependencies = {
            -- 'folke/neodev.nvim', -- lua api. Activate once
            {
                "jose-elias-alvarez/null-ls.nvim",
                event = "VimEnter",
                config = function()
                    local null_ls = require("null-ls")
                    null_ls.setup({
                        sources = {
                            null_ls.builtins.formatting.black,
                            null_ls.builtins.formatting.shfmt,
                            null_ls.builtins.formatting.prettier,
                            null_ls.builtins.formatting.pg_format.with({ filetypes = { "sql", "plsql", "pgsql" }}),
                            -- null_ls.builtins.diagnostics.eslint,
                            -- null_ls.builtins.completion.spell,
                            -- null_ls.builtins.formatting.stylua,
                            -- null_ls.builtins.formatting.deno_fmt,
                        },
                    })
                end
            },
        }
    },
}
