local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- default mappings
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = true,
    open_on_setup = true,
    open_on_setup_file = true,
    open_on_tab = true,
    sort_by = "name",
    root_dirs = {},
    prefer_startup_root = false,
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    respect_buf_cwd = true,
    view = {
        adaptive_size = false,
        centralize_selection = false,
        width = 40,
        height = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
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
            },
        },
    },
    renderer = {
        add_trailing = true,
        group_empty = false,
        highlight_git = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":~",
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = " ",
                    open = " ",
                    empty = " ",
                    empty_open = " ",
                    symlink = " ",
                    symlink_open = " ",
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
    ignore_ft_on_setup = {},
    system_open = {
        cmd = "",
        args = {},
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = true,
        custom = {},
        exclude = {},
    },
    filesystem_watchers = {
        enable = false,
        interval = 1000,
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 2000,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = true,
            restrict_above_cwd = false,
        },
        expand_all = {
            max_folder_discovery = 300,
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
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
        },
    },
}

-- autoclose on quit
vim.api.nvim_create_autocmd('BufEnter', {
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    nested = true,
})
