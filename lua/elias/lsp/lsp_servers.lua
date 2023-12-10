--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    -- Documentation and movements
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('gy', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('gR', vim.lsp.buf.references, 'Quick fix references')          -- quickfix referecnes
    nmap('gI', vim.lsp.buf.implementation, 'Quick fix implementations') -- quickfix implementations
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

    -- Diagnostics
    nmap('<leader>to', vim.diagnostic.setqflist, 'Proyect diagnostics')
    nmap('<leader>tO', vim.diagnostic.setloclist, 'Local buffer diagnostics')
    nmap('[e', vim.diagnostic.goto_prev, 'Jump to next diagnostic')
    nmap(']e', vim.diagnostic.goto_next, 'Jump to next diagnostic')
    nmap(']t', vim.diagnostic.open_float, 'Line diagnostics')

    -- Actions
    nmap('<leader>rr', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('co', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gr', "<cmd>References<cr>", '[G]oto [R]eferences') -- fzf references
    nmap('gi', "<cmd>Implementations<cr>", '[G]oto [I]mplementation')
end

local function configurar_server(server, settings)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local lspconfig = require("lspconfig")
    lspconfig[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = settings
    })
end

require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler
        configurar_server(server_name)
    end,

    ["volar"] = function()
        require("null-ls").disable({ "prettier" })
        configurar_server("volar")
    end,

    ["jdtls"] = function()
        local settings = {
            signatureHelp = { enabled = true },
        }
        configurar_server("jdtls", settings)
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
        configurar_server("vtsls")
    end
}
