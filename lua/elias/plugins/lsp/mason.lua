local function configureServers()
	--  This function gets run when an LSP connects to a particular buffer.
	local on_attach = function(client, bufnr)
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

		-- go to definition
		nmap("gd", vim.lsp.buf.definition, "Goto Definition")
		nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")

		-- go to references
		nmap("gr", vim.lsp.buf.references, "Quick fix references")
		nmap("gR", "<cmd>References<cr>", "Goto References")

		-- go to type definitions
		nmap("gy", vim.lsp.buf.type_definition, "Type [D]efinition")

		-- go to implementations
		nmap("gi", vim.lsp.buf.implementation, "Quick fix implementations")
		nmap("gI", "<cmd>Telescope lsp_implementations<cr>", "Telescope implementations")

		-- documentation
		nmap("K", vim.lsp.buf.hover, "Hover Documentation")

		-- Diagnostics
		nmap("<leader>to", vim.diagnostic.setqflist, "Proyect diagnostics")
		nmap("<leader>tO", vim.diagnostic.setloclist, "Local buffer diagnostics")
		nmap("[e", vim.diagnostic.goto_prev, "Jump to next diagnostic")
		nmap("]e", vim.diagnostic.goto_next, "Jump to next diagnostic")
		nmap("]t", vim.diagnostic.open_float, "Line diagnostics")

		-- Actions
		nmap("<leader>rr", vim.lsp.buf.rename, "Rename symbol")
		nmap("co", vim.lsp.buf.code_action, "Display code actions")
	end

	local function configurar_server(server, settings)
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local lspconfig = require("lspconfig")
		lspconfig[server].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = settings,
		})
	end

	require("mason-lspconfig").setup_handlers({
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
						},
					},
				},
			})
		end,

		["tailwindcss"] = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig["tailwindcss"].setup({
				capabilities = capabilities,
				root_dir = function(fname)
					local root_pattern =
						lspconfig.util.root_pattern("tailwind.config.cjs", "tailwind.config.js", "postcss.config.js")
					return root_pattern(fname)
				end,
			})
		end,

		["vtsls"] = function()
			require("lspconfig.configs").vtsls = require("vtsls").lspconfig
			configurar_server("vtsls")
		end,

		["jdtls"] = function()
			local settings = {
				signatureHelp = { enabled = true },
			}
			configurar_server("jdtls", settings)
		end,
	})
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

		require("lspconfig.ui.windows").default_options.border = "single"

		-- configure server just after mason is loaded
		configureServers()
	end,

	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
}
