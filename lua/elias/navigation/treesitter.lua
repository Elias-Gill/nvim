--treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "javascript", "go", "python", "bash", "java", "css", "json", "dockerfile" },
	sync_install = false,
	ignore_install = {},
	indent = { enable = true },
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
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
	-- change comment style for embeded languages
	context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
})
return

-- sticky context
--[[ require 'treesitter-context'.setup {
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 2, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    patterns = {
        default = {
            'class',
            'function',
            'method',
            'for',
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
        },
    },

    exact_patterns = {},
    zindex = 20, -- The Z-index of the context window
    mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
    separator = '─', -- Separator between context and content. Should be a single character string, like '-'.
} ]]
