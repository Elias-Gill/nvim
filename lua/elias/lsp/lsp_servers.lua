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
    nmap('gR', vim.lsp.buf.references, 'Quick fix references') -- quickfix referecnes
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

    -- Diagnostics
    nmap('<leader>to', vim.diagnostic.setqflist, 'Proyect diagnostics')
    nmap('<leader>tO', vim.diagnostic.setloclist, 'Local buffer diagnostics')
    nmap('[e', "<cmd>Lspsaga diagnostic_jump_prev<cr>", 'Jump previous diagnostic')
    nmap(']e', "<cmd>Lspsaga diagnostic_jump_next<cr>", 'Jump to next diagnostic')
    nmap(']t', "<cmd>Lspsaga show_line_diagnostics<cr>", 'Line diagnostics')

    -- Actions
    nmap('<leader>rr', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('co', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('=f', vim.lsp.buf.format, 'Formatting')

    nmap('gr', require('fzf-lua').lsp_references, '[G]oto [R]eferences') -- fzf references
    nmap('gi', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')
end

local function configurar_server(server)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local lspconfig = require("lspconfig")
    lspconfig[server].setup({
        capabilities = capabilities,
        on_attach = on_attach
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
