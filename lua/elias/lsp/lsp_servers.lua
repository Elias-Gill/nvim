local function configurar_server(server)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local lspconfig = require("lspconfig")
    lspconfig[server].setup({ capabilities = capabilities })
end

require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler
        configurar_server(server_name)
    end,

    -- Dedicated handlers for specific servers.
    ["jsonls"] = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local lspconfig = require("lspconfig")
        lspconfig["jsonls"].setup({ capabilities = capabilities })
    end,

    ["volar"] = function()
        require("null-ls").disable({ "prettier" })
        configurar_server("volar")
    end,

    ["sqlls"] = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local lspconfig = require("lspconfig")
        lspconfig["sqlls"].setup({
            capabilities = capabilities,
            filetypes = { "sql", "plsql" },
            settings = {
                sqlLanguageServer = {
                    lint = {
                        rules = {
                            ["align-column-to-the-first"] = "off",
                            ["column-new-line"] = "off",
                            ["linebreak-after-clause-keyword"] = "off",
                            ["reserved-word-case"] = "off",
                            ["space-surrounding-operators"] = "off",
                            ["where-clause-new-line"] = "off",
                            ["align-where-clause-to-the-first"] = "off",
                        },
                    }
                }
            }
        })
    end,
    ["vtsls"] = function()
        require("lspconfig.configs").vtsls = require("vtsls").lspconfig
        require("lspconfig").vtsls.setup({
            auto
        })
    end
}
