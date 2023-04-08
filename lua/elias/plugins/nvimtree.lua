return {
    "kyazdani42/nvim-tree.lua",
    -- Navigation
    config = function()
        local tree_cb = require("nvim-tree.config").nvim_tree_callback
        require("nvim-tree").setup({
            -- BEGIN_DEFAULT_OPTS
            hijack_cursor = true,
            hijack_netrw = true,
            open_on_tab = false,
            sync_root_with_cwd = true,
            reload_on_bufenter = true,
            respect_buf_cwd = false,
            view = {
                width = 32,
                signcolumn = "no",
                mappings = {
                    custom_only = true,
                    list = {
                        { key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
                        { key = { "<2-RightMouse>", "cd" },       cb = tree_cb("cd") },
                        { key = "v",                              cb = tree_cb("vsplit") },
                        { key = "s",                              cb = tree_cb("split") },
                        { key = "t",                              cb = tree_cb("tabnew") },
                        { key = "P",                              cb = tree_cb("parent_node") },
                        { key = "<BS>",                           cb = tree_cb("close_node") },
                        { key = "I",                              cb = tree_cb("toggle_ignored") },
                        { key = "i",                              cb = tree_cb("toggle_dotfiles") },
                        { key = "R",                              cb = tree_cb("refresh") },
                        { key = "a",                              cb = tree_cb("create") },
                        { key = "D",                              cb = tree_cb("remove") },
                        { key = "d",                              cb = tree_cb("trash") },
                        { key = "r",                              cb = tree_cb("rename") },
                        { key = "<C-r>",                          cb = tree_cb("full_rename") },
                        { key = "x",                              cb = tree_cb("cut") },
                        { key = "y",                              cb = tree_cb("copy") },
                        { key = "p",                              cb = tree_cb("paste") },
                        { key = "<C-c>",                          cb = tree_cb("copy_name") },
                        { key = "<C-p>",                          cb = tree_cb("copy_absolute_path") },
                        { key = "u",                              cb = tree_cb("dir_up") },
                        { key = "q",                              cb = tree_cb("close") },
                        { key = "?",                              cb = tree_cb("toggle_help") },
                    },
                },
            },
            renderer = {
                indent_markers = {
                    enable = false,
                },
                icons = {
                    glyphs = {
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
            update_focused_file = {
                enable = true,
                update_root = true,
                ignore_list = {},
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
            },
            trash = {
                cmd = "trash",
                require_confirm = true,
            },
        })

        -- autoclose on quit
        vim.api.nvim_create_autocmd("BufEnter", {
            command = "if winnr('$') == 1 && bufname() =~ 'NvimTree_' . tabpagenr() | quit | endif",
            nested = true,
        })

        -- Open on setup
        local function open_nvim_tree(data)
            local real_file = vim.fn.filereadable(data.file) == 1
            local is_open = require('nvim-tree.view').is_visible()
            if real_file and not is_open then
                require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
                vim.api.nvim_del_augroup_by_name("AbrirTree")
            end
        end

        local group_id = vim.api.nvim_create_augroup("AbrirTree", { clear = true })
        vim.api.nvim_create_autocmd({ "BufWinEnter", "BufAdd", },
            { callback = open_nvim_tree, group = group_id })
    end
}
