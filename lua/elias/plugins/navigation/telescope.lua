-- TELESCOPICK JOHNSON --
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	event = "VeryLazy",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},

		-- git worktree extension
		{ "mgierada/git-worktree.nvim", lazy = true },
	},

	config = function()
		require("telescope").setup({
			defaults = {
				path_display = {
					truncate = 1,
				},
				sorting_strategy = "descending",

				preview = {
					treesitter = {
						enable = false,
					},
				},

				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						preview_width = 0.4,
					},
					height = 0.7,
				},

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

				fd = {
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

		-- Mapeos de teclas en Neovim usando Lua
		local keymaps = {
			{ "<C-p>", "<cmd>Telescope fd<cr>", { noremap = true, silent = true, desc = "Open fuzzy finder" } },
			{
				"<leader>fr",
				"<cmd>Telescope resume<cr>",
				{ noremap = true, silent = true, desc = "Resume telescope find" },
			},
			{ "<leader>ff", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true, desc = "Live grep" } },
			{
				"<leader>fo",
				"<cmd>Telescope oldfiles<cr>",
				{ noremap = true, silent = true, desc = "Search files history" },
			},
			{
				"<leader>fm",
				"<cmd>Telescope builtin include_extensions=true<cr>",
				{ noremap = true, silent = true, desc = "Telescope Menu" },
			},
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true, desc = "Help tags" } },
			{
				"<leader>f",
				'<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.getreg(""") })<cr>',
				{ noremap = true, silent = true, desc = "Grep for selection" },
				mode = "v",
			},
		}

		-- Configurar los mapeos
		for _, keymap in ipairs(keymaps) do
			local key, cmd, opts = unpack(keymap)
			local mode = opts.mode or "n"
			vim.api.nvim_set_keymap(mode, key, cmd, opts)
		end
	end,
}
