local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
    ignore_buffer_on_setup = true, -- open on startup
    open_on_setup = true, -- open on startup
    open_on_setup_file = true, -- open on startup
    open_on_tab = false,
    sort_by = "name",
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    respect_buf_cwd = false,
    view = {
        adaptive_size = false,
        centralize_selection = false,
        width = 32,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "no",
        mappings = {
            custom_only = true,
            list = {
                { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
                { key = {"<2-RightMouse>", "cd"},       cb = tree_cb("cd") },
                { key = "v",                            cb = tree_cb("vsplit") },
                { key = "s",                            cb = tree_cb("split") },
                { key = "t",                            cb = tree_cb("tabnew") },
                { key = "P",                            cb = tree_cb("parent_node") },
                { key = "<BS>",                         cb = tree_cb("close_node") },
                { key = "K",                            cb = tree_cb("first_sibling") },
                { key = "J",                            cb = tree_cb("last_sibling") },
                { key = "I",                            cb = tree_cb("toggle_ignored") },
                { key = "i",                            cb = tree_cb("toggle_dotfiles") },
                { key = "R",                            cb = tree_cb("refresh") },
                { key = "a",                            cb = tree_cb("create") },
                { key = "D",                            cb = tree_cb("remove") },
                { key = "d",                            cb = tree_cb("trash") },
                { key = "r",                            cb = tree_cb("rename") },
                { key = "<C-r>",                        cb = tree_cb("full_rename") },
                { key = "x",                            cb = tree_cb("cut") },
                { key = "y",                            cb = tree_cb("copy") },
                { key = "p",                            cb = tree_cb("paste") },
                { key = "<C-c>",                        cb = tree_cb("copy_name") },
                { key = "<C-C>",                        cb = tree_cb("copy_path") },
                { key = "gy",                           cb = tree_cb("copy_absolute_path") },
                { key = "u",                            cb = tree_cb("dir_up") },
                { key = "q",                            cb = tree_cb("close") },
                { key = "?",                            cb = tree_cb("toggle_help") },
            },
        },
    },
    renderer = {
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "👀",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
    },
    diagnostics = {
        enable = false,
    },
    filters = {
        dotfiles = true,
        custom = {},
        exclude = {},
    },
    filesystem_watchers = {
        enable = false,
        debounce_delay = 2000,
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 3000,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = true,
            restrict_above_cwd = false,
        },
        expand_all = {
            max_folder_discovery = 50,
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
        remove_file = {
            close_window = true,
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
}

-- autoclose on quit
vim.api.nvim_create_autocmd('BufEnter', {
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    nested = true,
})
