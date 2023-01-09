local null_ls = require("null-ls")

-- formaters, linters y extra completition for non lsp programs -- 
null_ls.setup({
	sources = {
        -- linters
		-- null_ls.builtins.diagnostics.eslint,
        -- completition
		-- null_ls.builtins.completion.spell,
        -- formaters
		null_ls.builtins.formatting.black,
		-- null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,
	},
})
