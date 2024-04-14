-- TELESCOPICK JOHNSON --
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},

		"ThePrimeagen/git-worktree.nvim",
	},

	config = function()
		require("telescope").setup({
			defaults = {
				path_display = {
					truncate = 1,
				},

				layout_strategy = "horizontal",

				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.4,
					},
					height = 0.7,
				},
				sorting_strategy = "ascending",

				mappings = {
					i = {
						["<C-h>"] = "which_key",
						["<C-k>"] = "move_selection_previous",
						["<C-j>"] = "move_selection_next",
					},
				},

				file_ignore_patterns = { ".git", "go/", "*.class", "VirtualBox/", "node_modules/" },
			},

			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
			},

			pickers = {
				find_files = {
					disable_devicons = true,
				},

				live_grep = {
					disable_devicons = true,
				},
			},
		})

		-- extensions loading
		require("telescope").load_extension("fzf")
		-- require("telescope").load_extension("git_worktree")
	end,

	keys = {
		{ "<C-p>", "<cmd>Telescope find_files<cr>", mode = "n", desc = "Open fuzzy finder" },
		{ "<leader>tr", "<cmd>Telescope resume<cr>", mode = "n", desc = "Resume telescope find" },
		{ "<C-s>", "<cmd>Telescope<cr>", mode = "n", desc = "Open telescope menu" },
		{ "<leader>of", "<cmd>Telescope oldfiles<cr>", mode = "n", desc = "Search files history" },
		{ "<leader>f", "<cmd>Telescope live_grep<cr>", mode = "n", desc = "Live grep files" },
		{ "<leader>f", 'y:Telescope grep_string search=<c-r>"<cr>', mode = "v", desc = "Grep for selection" },

		-- git worktree extension
		--[[ {
			"<leader>lw",
			"<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
			mode = "n",
			desc = "List git worktree files",
		},
		{
			"<leader>nw",
			"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
			mode = "n",
			desc = "Create a new git worktree",
		}, ]]
	},
}
