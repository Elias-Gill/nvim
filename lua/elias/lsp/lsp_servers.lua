-- lspconfig
local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")
lspconfig.pyright.setup({ capabilities = capabilities })
lspconfig.tsserver.setup({ capabilities = capabilities })
lspconfig.bashls.setup({ capabilities = capabilities })
lspconfig.gopls.setup({ capabilities = capabilities })
lspconfig.lua_ls.setup({ capabilities = capabilities })
lspconfig.vimls.setup({ capabilities = capabilities })
lspconfig.jsonls.setup({ capabilities = capabilities })
lspconfig.svelte.setup({ capabilities = capabilities })
lspconfig.rust_analyzer.setup({ capabilities = capabilities })
return

-- lspconfig.omnisharp.setup({})
-- lspconfig.volar.setup({
-- 	on_atach = function()
-- 		require("null-ls").disable({ "prettier" })
-- 	end,
-- })
-- lspconfig.html.setup {}
-- lspconfig.cssls.setup {}
-- lspconfig.clangd.setup({})
-- lspconfig.phpactor.setup({})
-- lspconfig.intelephense.setup({})
-- lspconfig.texlab.setup({})
-- lspconfig.jdtls.setup({})
