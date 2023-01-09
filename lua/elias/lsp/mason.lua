local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end
-- lsp_installer
mason.setup({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup({
	automatic_installation = false,
	ensure_installed = { "sumneko_lua", "gopls", "clangd", "tsserver", "bashls", "pyright", "vimls" },
})
