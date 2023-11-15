return {
    -- Lsp configs
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
            require("elias.lsp.lsp-visuals")
        end
    }
}

-- dependencies = {
-- for fancy symbols tree use "DNLHC/glance.nvim"
-- for super html completition use emmet-lsp-server

-- { -- better typescript lsp
--     "yioneko/nvim-vtsls",
--     config = function()
--         require('vtsls').config({
--             refactor_auto_rename = true,
--         })
--     end
-- },
-- }
