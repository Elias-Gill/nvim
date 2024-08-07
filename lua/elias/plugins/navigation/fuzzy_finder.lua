-- TELESCOPICK JOHNSON --
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},

		-- git worktree extension
		{
			"ThePrimeagen/git-worktree.nvim",
			config = function()
				vim.api.nvim_create_user_command(
					"WorkTreeList",
					require("telescope").extensions.git_worktree.git_worktrees,
					{}
				)

				vim.api.nvim_create_user_command(
					"WorkTreeNew",
					require("telescope").extensions.git_worktree.create_git_worktree,
					{}
				)
			end,
		},
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
						prompt_position = "bottom",
						preview_width = 0.4,
					},
					height = 0.7,
				},
				sorting_strategy = "descending",

				mappings = {
					i = {
						["<C-h>"] = "which_key",
						["<C-k>"] = "move_selection_previous",
						["<C-j>"] = "move_selection_next",
					},
				},

				file_ignore_patterns = { "go/", "*.class", "VirtualBox/", "node_modules/" },
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
		require("telescope").load_extension("git_worktree")
	end,

	keys = {
		{ "<C-p>", "<cmd>Telescope find_files<cr>", mode = "n", desc = "Open fuzzy finder" },
		{ "<leader>fr", "<cmd>Telescope resume<cr>", mode = "n", desc = "Resume telescope find" },
		{ "<leader>ff", "<cmd>Telescope live_grep<cr>", mode = "n", desc = "Live grep" },
		{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", mode = "n", desc = "Search files history" },
		{ "<leader>fm", "<cmd>Telescope<cr>", mode = "n", desc = "Telescope Menu" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", mode = "n", desc = "Help tags" },
		{ "<leader>f", 'y:Telescope grep_string search=<c-r>"<cr>', mode = "v", desc = "Grep for selection" },
	},
}
