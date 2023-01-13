-- change lsp default icons to be better
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		prefix = "",
		spacing = 1,
	},
	signs = true,
	underline = true,
	update_in_insert = true,
})
-- change gutter icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- lspsaga

require("lspsaga").init_lsp_saga({
	code_action_lightbulb = {
		enable = false,
		sign = false,
		enable_in_insert = false,
		sign_priority = 2,
		virtual_text = false,
	},
	symbol_in_winbar = {
		enable = false,
	},
})
