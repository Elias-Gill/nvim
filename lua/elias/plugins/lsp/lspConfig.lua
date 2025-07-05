return {
	-- Lsp configs
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		config = function()
			-- change lsp default borders
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = {
						prefix = "",
						spacing = 1,
					},
					signs = true,
					underline = true,
					update_in_insert = true,
				})

            -- Set max size to lsp-hover window
			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or "single"
				opts.max_width = opts.max_width or 90
				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end

            -- Change diagnostic icons and colors
			vim.diagnostic.config({
				float = { border = "single" },
				severity_sort = true,
				source = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = " ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
			})
		end,
	},
}
