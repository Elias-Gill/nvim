return {
    -- Lsp configs
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
            require("elias.lsp.lsp-visuals")
        end,
        dependencies = {
            -- for fancy symbols tree use "DNLHC/glance.nvim"
            -- for super html completition use emmet-lsp-server

            { -- better typescript lsp
                "yioneko/nvim-vtsls",
                config = function()
                    require('vtsls').config({
                        refactor_auto_rename = true,
                    })
                end
            },
            { -- external commands like linters, formatters, etc
                "jose-elias-alvarez/null-ls.nvim",
                event = "VeryLazy",
                config = function()
                    local null_ls = require("null-ls")
                    null_ls.setup({
                        sources = {
                            null_ls.builtins.formatting.black,
                            null_ls.builtins.formatting.shfmt,
                            null_ls.builtins.formatting.prettier,
                            null_ls.builtins.diagnostics.eslint,
                            null_ls.builtins.formatting.pg_format.with({ filetypes = { "sql", "plsql", "pgsql" } }),
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
