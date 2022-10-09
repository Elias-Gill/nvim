-- lsp_installer
require("mason").setup({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    automatic_installation = false,
    ensure_installed = { "sumneko_lua", "gopls", "clangd", "tsserver", "bashls" }
})

-- lspconfig
local lspconfig = require('lspconfig')
lspconfig.pyright.setup { on_attach = on_attach }
lspconfig.tsserver.setup { on_attach = on_attach }
lspconfig.clangd.setup { on_attach = on_attach }
lspconfig.bashls.setup { on_attach = on_attach }
lspconfig.gopls.setup { on_attach = on_attach }
lspconfig.sumneko_lua.setup { on_attach = on_attach }
lspconfig.vimls.setup { on_attach = on_attach }
lspconfig.jdtls.setup {}
-- lspconfig.svelte.setup { on_attach = on_attach }
-- lspconfig.cssls.setup { on_attach = on_attach }
-- lspconfig.vuels.setup{on_attach = on_attach}
-- lspconfig.html.setup{on_attach = on_attach}
-- lspconfig.jsonls.setup{on_attach = on_attach}

-- change lsp default icons to be better
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'single' })

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = 'single' })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = {
            prefix = "",
            spacing = 1
        },
        signs = true,
        underline = true,
        update_in_insert = true
    })

-- change gutter icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- lspsaga
local saga = require 'lspsaga'
saga.init_lsp_saga({
    code_action_lightbulb = {
        enable = false,
        sign = true,
        enable_in_insert = true,
        sign_priority = 2,
        virtual_text = false,
    },
    symbol_in_winbar = {
        enable = false,
    },
})
