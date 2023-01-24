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
        file_ignore_patterns = { '.git', 'go/', '.class', '.pdf', 'VirtualBox', 'node_modules' },
    },
    -- configuracion de los pickers
    pickers = {
        --
    },

    -- extensiones de telescope
    extensions = {
        -- require("telescope").load_extension('harpoon')
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        }
    }
}
require('telescope').load_extension('fzf')
