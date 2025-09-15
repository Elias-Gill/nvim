local function setup_keymaps(client, bufnr)
	-- don't mess with treesitter highlights
	if vim.version().minor >= 9 then
		client.server_capabilities.semanticTokensProvider = nil
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
    nmap("grn", vim.lsp.buf.rename, "Rename symbol")

	-- Diagnostics
	nmap("<leader>to", vim.diagnostic.setqflist, "Proyect diagnostics")
	nmap("<leader>tO", vim.diagnostic.setloclist, "Local buffer diagnostics")
	nmap("]t", vim.diagnostic.open_float, "Line diagnostics")
	nmap("[e", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, "Jump to next diagnostic")
	nmap("]e", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, "Jump to next diagnostic")

	-- Actions
	nmap("co", vim.lsp.buf.code_action, "Display code actions")
	nmap("<leader>li", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end, "Toggle display inlay hints")
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

		---- jdtls (java lsp) config -----
		vim.lsp.config("jdtls", {
			settings = {
				signatureHelp = { enabled = true },
				semanticTokensProvider = nil,
			},
			cmd = {
				"jdtls",
				"--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand("$MASON/share/jdtls/lombok.jar")),
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
