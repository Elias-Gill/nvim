return {
    -- Lsp configs
    { "neovim/nvim-lspconfig",
        config = function()
            require("elias.lsp.lsp_servers")
            require("elias.lsp.lsp-visuals")
        end,
        dependencies = {
            { "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    local null_ls = require("null-ls")
                    null_ls.setup({
                        sources = {
                            null_ls.builtins.formatting.black,
                            null_ls.builtins.formatting.shfmt,
                            null_ls.builtins.formatting.prettier,
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
