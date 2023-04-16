return {
    "williamboman/mason.nvim",
    config = function()
        local status_ok, mason = pcall(require, "mason")
        if not status_ok then
            return
        end
        -- lsp_installer
        mason.setup({
            ui = {
                border = "single",
                icons = {
                    server_installed = "✓",
                    server_pending = "➜",
                    server_uninstalled = "✗",
                },
            },
        })
        require("mason-lspconfig").setup({
            automatic_installation = false,
            ensure_installed = { "lua_ls", "bashls", "vimls" },
        })
    end,
    cmd = "Mason",
    event = "BufAdd",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    }
}