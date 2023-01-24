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

require("lspsaga").setup({
	lightbulb = {
		enable = false,
		sign = false,
		enable_in_insert = false,
		sign_priority = 2,
		virtual_text = false,
	},
	symbol_in_winbar = {
		enable = false,
	},
	ui = {
		-- currently only round theme
		theme = "round",
		-- border type can be single,double,rounded,solid,shadow.
		border = "single",
		winblend = 0,
		expand = "",
		collapse = "",
		preview = " ",
		diagnostic = "🐞",
		incoming = " ",
		outgoing = " ",
		colors = {
			--float window normal bakcground color
			normal_bg = "#1c1c19",
			--title background color
			title_bg = "#eeeeee",
			red = "#e95678",
			magenta = "#b33076",
			orange = "#FF8700",
			yellow = "#f7bb3b",
			green = "#afd700",
			cyan = "#36d0e0",
			blue = "#61afef",
			purple = "#CBA6F7",
			white = "#d1d4cf",
			black = "#1c1c19",
		},
		kind = {},
	},
})
return
--[[ OLD LSPSAGA CONFIG
require("lspsaga").setup({
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
return ]]
