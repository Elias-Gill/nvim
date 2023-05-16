-- lspconfig
local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")

local servers = {
    { "pyright" },
    { "tsserver" },
    { "bashls" },
    { "gopls" },
    { "lua_ls" },
    { "vimls" },
    { "jsonls" },
    { "svelte" },
    { "rust_analyzer" },
    {
        "sqlls",
        config = {
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
        }
    }
    -- { "omnisharp" }
    -- { "html" }
    -- { "cssls" }
    -- { "clangd" }
    -- { "phpactor" }
    -- { "intelephense" }
    -- { "texlab" }
    -- { "jdtls" }
    -- { "volar", config = {
    -- 	on_atach = function()
    -- 		require("null-ls").disable({ "prettier" })
    -- 	end,
    -- } }
}

local function configurar_servers()
    for _, table in pairs(servers) do
        if type(table.config) ~= "table" then
            table.config = {}
        end
        table.config.capabilities = capabilities
        lspconfig[table[1]].setup(table.config)
    end
end
configurar_servers()
