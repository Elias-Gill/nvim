local function setup_keymaps(client, bufnr)
	-- don't mess with treesitter highlights
	if vim.version().minor >= 9 then
		client.server_capabilities.semanticTokensProvider = vim.NIL
	end

	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	-- go to
	nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
    nmap("gd", vim.lsp.buf.definition, "Goto Definition")
	nmap("gy", vim.lsp.buf.type_definition, "Type Definition")

	-- Diagnostics
	nmap("<leader>to", vim.diagnostic.setqflist, "Proyect diagnostics")
	nmap("<leader>tO", vim.diagnostic.setloclist, "Local buffer diagnostics")
	nmap("[e", vim.diagnostic.goto_prev, "Jump to next diagnostic")
	nmap("]e", vim.diagnostic.goto_next, "Jump to next diagnostic")
	nmap("]t", vim.diagnostic.open_float, "Line diagnostics")

	-- Actions
	nmap("co", vim.lsp.buf.code_action, "Display code actions")
end

return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	config = function()
		require("mason").setup({
			ui = {
				border = "single",
				icons = {
					server_installed = "✓",
					server_pending = "➜",
					server_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			automatic_installation = false,
			ensure_installed = { "lua_ls", "bashls", "vimls" },
		})

		vim.lsp.config("jdtls", {
			settings = {
				signatureHelp = { enabled = true },
				semanticTokensProvider = nil,
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("my.lsp", {}),
			callback = function(args)
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
				setup_keymaps(client, 0)
			end,
		})
	end,

	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
}
