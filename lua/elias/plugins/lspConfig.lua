return {
    -- Lsp configs
    { "neovim/nvim-lspconfig",
        config = function()
            require("elias.lsp.mason")
            require("elias.lsp.luasnips")
            require("elias.lsp.lsp_servers")
            require("elias.lsp.null_ls")
            require("elias.lsp.lsp-visuals")
        end,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "glepnir/lspsaga.nvim",
            "jose-elias-alvarez/null-ls.nvim",
            -- 'folke/trouble.nvim'
        }
    },
}
