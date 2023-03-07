return {
    -- Lsp configs
    { "neovim/nvim-lspconfig",
        config = function() require("elias/utils/lsp-visuals") end,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "glepnir/lspsaga.nvim",
            "jose-elias-alvarez/null-ls.nvim",
            -- 'folke/trouble.nvim'
        }
    },
}