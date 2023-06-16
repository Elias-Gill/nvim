return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	cmd = "Telescope",
	dependencies = {
		{ "nvim-telescope/telescope-ui-select.nvim" }
	},
	config = function()
		-- TELESCOPICK JOHNSON --
		require('telescope').setup {
			defaults = {
				-- Default configuration for telescope goes here:
				-- config_key = value,
				mappings = {
					i = {
						["<C-h>"] = "which_key",
						["<C-k>"] = "move_selection_previous",
						["<C-j>"] = "move_selection_next",
						["<esc>"] = "close"
					}
				},
				file_ignore_patterns = { '.git', 'go/', '*.class', 'VirtualBox/', 'node_modules/' },
			},
			-- configuracion de los pickers
			pickers = {
				--
			},

			-- extensiones de telescope
			extensions = {
				-- require("telescope").load_extension('harpoon')
				["ui-select"] = {
					require("telescope.themes").get_cursor({})
				}
			}
		}
		require("telescope").load_extension("ui-select")
		-- require("telescope").load_extension("git_worktree")
	end
}
