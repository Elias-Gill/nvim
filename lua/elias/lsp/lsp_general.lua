-- lspconfig
local lspconfig = require("lspconfig")
lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})
lspconfig.bashls.setup({})
lspconfig.gopls.setup({})
lspconfig.lua_ls.setup({})
lspconfig.vimls.setup({})
lspconfig.jsonls.setup({})
lspconfig.svelte.setup({})
lspconfig.omnisharp.setup({})
lspconfig.volar.setup({
	on_atach = function()
		require("null-ls").disable({ "prettier" })
	end,
})
return
-- lspconfig.html.setup {}
-- lspconfig.cssls.setup {}
-- lspconfig.clangd.setup({})
-- lspconfig.phpactor.setup({})
-- lspconfig.intelephense.setup({})
-- lspconfig.texlab.setup({})
-- lspconfig.jdtls.setup({})
