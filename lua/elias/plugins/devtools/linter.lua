return {
	"mfussenegger/nvim-lint",
	event = "BufWritePre",
	config = function()
		require("lint").linters_by_ft = {
			-- markdown = { 'vale', },
			javascript = { "eslint" },
			typescript = { "eslint" },
			typescriptreact = { "eslint" },
			javascriptreact = { "eslint" },
			astro = { "eslint" },
			svelte = { "eslint" },
			vue = { "eslint" },
			lua = { "luacheck" },
			golang = { "golangcilint" },
			go = { "golangcilint" },
			git = { "gitlint" },
            -- python = { "pylint" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint(nil, { ignore_errors = true })
			end,
		})
	end,
}
