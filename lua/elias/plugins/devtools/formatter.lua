-- INFO: FOR LINTING use: 'https://github.com/mfussenegger/nvim-lint'
return {
	"stevearc/conform.nvim",
	-- event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"=f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "black", "isort" },
				bash = { "shfmt" },
				markdown = { "mdslw" },
				sh = { "shfmt" },
				ocaml = { "ocamlformat" },
				-- Use a sub-list to run only the first available formatter
				javascript = { "prettier" },
				html = { "djlint" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
				astro = { "prettier" },
			},
		})

		require("conform").formatters.mdslw = {
			prepend_args = { "--max-width", "95" },
		}
	end,
}
