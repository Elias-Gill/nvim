local function tsConfig()
	vim.g.skip_ts_context_commentstring_module = true
	require("ts_context_commentstring").setup({})

	--treesitter
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"yaml",
			"json",
			"toml",
			"markdown",
			"vimdoc",
			"markdown_inline",
			"lua",
			"javascript",
			"go",
			"bash",
		},
		sync_install = false,
		ignore_install = {},
		indent = { enable = true, disable = { "python" } },
		highlight = {
			enable = true,
			disable = {},
			additional_vim_regex_highlighting = { "markdown" },
		},
		-- select incrementaly
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<c-space>",
				node_incremental = "+",
				node_decremental = "-",
			},
		},
		-- epic moves between text objects
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = "@function.outer",
				["]c"] = "@class.outer",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]C"] = "@class.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[c"] = "@class.outer",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[C"] = "@class.outer",
			},
		},
		-- treesitter object mappings configuration
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ib"] = "@block.inner",
					["ab"] = "@block.outer",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
					["at"] = "@tag.outer",
					["it"] = "@tag.inner",
					["aP"] = "@parameter.outer",
					["iP"] = "@parameter.inner",
				},
			},
		},
		-- swap functions parameters
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	})
end

return {
	-- Tree sitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "UIEnter",
		config = tsConfig,
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
}
