-- TELESCOPICK JOHNSON --
-- config
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
        }
    },
    extensions = {
        -- require("telescope").load_extension('harpoon')
    }
}
