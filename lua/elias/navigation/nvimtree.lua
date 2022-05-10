local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- default mappings
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = true,
    ignore_ft_on_setup  = {},
    auto_close          = false,
    open_on_tab         = false,
    hijack_cursor       = true,
    update_cwd          = true,
    update_to_buf_dir   = {
        enable = false,
        auto_open = false,
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    update_focused_file = {
        enable      = true,
        update_cwd  = true,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    filters = {
        dotfiles = true,
        custom = {}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 1000,
    },
    view = {
        width = 45,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = true,
        mappings = {
            custom_only = true,
            list = {
            { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
            { key = {"<2-RightMouse>", "cd"},    cb = tree_cb("cd") },
            { key = "<C-v>",                        cb = tree_cb("vsplit") },
            { key = "<C-i>",                        cb = tree_cb("split") },
            { key = "t",                        cb = tree_cb("tabnew") },
            { key = "<",                            cb = tree_cb("prev_sibling") },
            { key = ">",                            cb = tree_cb("next_sibling") },
            { key = "P",                            cb = tree_cb("parent_node") },
            { key = "<BS>",                         cb = tree_cb("close_node") },
            { key = "<S-CR>",                       cb = tree_cb("close_node") },
            { key = "<Tab>",                        cb = tree_cb("preview") },
            { key = "K",                            cb = tree_cb("first_sibling") },
            { key = "J",                            cb = tree_cb("last_sibling") },
            { key = "I",                            cb = tree_cb("toggle_ignored") },
            { key = "i",                            cb = tree_cb("toggle_dotfiles") },
            { key = "R",                            cb = tree_cb("refresh") },
            { key = "a",                            cb = tree_cb("create") },
            { key = "d",                            cb = tree_cb("remove") },
            { key = "D",                            cb = tree_cb("trash") },
            { key = "r",                            cb = tree_cb("rename") },
            { key = "<C-r>",                        cb = tree_cb("full_rename") },
            { key = "x",                            cb = tree_cb("cut") },
            { key = "y",                            cb = tree_cb("copy") },
            { key = "p",                            cb = tree_cb("paste") },
            { key = "<C-c>",                            cb = tree_cb("copy_name") },
            { key = "<C-C>",                            cb = tree_cb("copy_path") },
            { key = "gy",                           cb = tree_cb("copy_absolute_path") },
            { key = "[",                           cb = tree_cb("prev_git_item") },
            { key = "]",                           cb = tree_cb("next_git_item") },
            { key = "u",                            cb = tree_cb("dir_up") },
            { key = "s",                            cb = tree_cb("system_open") },
            { key = "q",                            cb = tree_cb("close") },
            { key = "?",                           cb = tree_cb("toggle_help") },
            }
        },
        number = false,
        relativenumber = false
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    },
    actions = {
        change_dir = {
            global = true,
        },
        open_file = {
            quit_on_open = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = {
                        "notify",
                        "packer",
                        "plug",
                        "qf"
                    }
                }
            }
        }
    }
}

