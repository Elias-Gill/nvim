-- lspconfig
local lspconfig = require("lspconfig")
lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})
lspconfig.bashls.setup({})
lspconfig.gopls.setup({})
lspconfig.sumneko_lua.setup({})
lspconfig.vimls.setup({})
lspconfig.jsonls.setup({})
lspconfig.omnisharp.setup({})
lspconfig.volar.setup({
	on_atach = function()
		require("null-ls").disable({ "prettier" })
	end,
})

-- lspconfig.cssls.setup {}
-- lspconfig.html.setup {}
-- lspconfig.clangd.setup({})
-- lspconfig.phpactor.setup({})
-- lspconfig.intelephense.setup({})
-- lspconfig.texlab.setup({})
-- lspconfig.jdtls.setup({})
