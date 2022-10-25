local actions = require("diffview.actions")
require("diffview").setup({
    diff_binaries = false, -- Show diffs for binaries
    enhanced_diff_hl = true, -- See |diffview-config-enhanced_diff_hl|
    git_cmd = { "git" }, -- The git executable followed by default args.
    use_icons = true, -- Requires nvim-web-devicons
    watch_index = true, -- Update views and index buffers when the git index changes.
    icons = { -- Only applies when use_icons is true.
        folder_closed = "",
        folder_open = "",
    },
    signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
    },
    file_panel = {
        listing_style = "tree", -- One of 'list' or 'tree'
        tree_options = { -- Only applies when listing_style is 'tree'
            flatten_dirs = true, -- Flatten dirs that only contain one single dir
            folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
        },
        win_config = { -- See |diffview-config-win_config|
            position = "bottom",
            width = 8,
            win_opts = {},
        },
    },
    file_history_panel = {
        log_options = { -- See |diffview-config-log_options|
            single_file = {
                diff_merges = "combined",
            },
            multi_file = {
                diff_merges = "first-parent",
            },
        },
        win_config = { -- See |diffview-config-win_config|
            position = "bottom",
            height = 8,
            win_opts = {},
        },
    },
    keymaps = {
        disable_defaults = false, -- Disable the default keymaps
        view = {
            ["<leader>0"] = actions.conflict_choose("ours"), -- Choose the OURS version of a conflict
            ["<leader>2"] = actions.conflict_choose("theirs"), -- Choose the THEIRS version of a conflict
            ["<leader>1"] = actions.conflict_choose("base"), -- Choose the BASE version of a conflict
            ["<leader>3"] = actions.conflict_choose("all"), -- Choose all the versions of a conflict
            ["dx"]         = actions.conflict_choose("none"), -- Delete the conflict region
        },
    },
})
-- vim: ft=lua
