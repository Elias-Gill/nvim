local actions = require "fzf-lua.actions"
require 'fzf-lua'.setup {
    global_resume       = true,
    global_resume_query = true,
    winopts             = {
        height     = 0.85,
        width      = 0.80,
        row        = 0.35,
        col        = 0.50,
        border     = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        fullscreen = false,
        hl         = {
            normal = 'Normal',
            border = 'Normal',

            cursor     = 'Cursor',
            cursorline = 'CursorLine',
            search     = 'Search',
        },
        preview    = {
            border       = 'border',
            wrap         = 'nowrap',
            hidden       = 'nohidden',
            vertical     = 'up:65%',
            horizontal   = 'right:60%',
            layout       = 'horizontal',
            flip_columns = 120,
            title        = true,
            scrollbar    = 'float',
            scrolloff    = '-2',
            scrollchars  = { '█', '' },
            delay        = 100,

            winopts = {
                number         = true,
                relativenumber = false,
                cursorline     = true,
                cursorlineopt  = 'both',
                cursorcolumn   = false,
                signcolumn     = 'no',
                list           = false,
                foldenable     = false,
                foldmethod     = 'manual',
            },
        },
        on_create  = function()
            -- can be used to add custom fzf-lua mappings, e.g:
            --   vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<Down>", { silent = true, noremap = true })
        end,
    },
    keymap              = {
        builtin = {
            -- neovim `:tmap` mappings for the fzf win
            ["<F1>"]     = "toggle-help",
            ["<F2>"]     = "toggle-fullscreen",
            -- Only valid with the 'builtin' previewer
            ["<F3>"]     = "toggle-preview-wrap",
            ["<F4>"]     = "toggle-preview",
            -- Rotate preview clockwise/counter-clockwise
            ["<F5>"]     = "toggle-preview-ccw",
            ["<F6>"]     = "toggle-preview-cw",
            ["<S-down>"] = "preview-page-down",
            ["<S-up>"]   = "preview-page-up",
            ["<S-left>"] = "preview-page-reset",
        },
        fzf = {
            -- fzf '--bind=' options
            ["ctrl-z"]     = "abort",
            ["ctrl-u"]     = "unix-line-discard",
            ["ctrl-f"]     = "half-page-down",
            ["ctrl-b"]     = "half-page-up",
            ["ctrl-a"]     = "beginning-of-line",
            ["ctrl-e"]     = "end-of-line",
            ["alt-a"]      = "toggle-all",
            -- Only valid with fzf previewers (bat/cat/git/etc)
            ["f3"]         = "toggle-preview-wrap",
            ["f4"]         = "toggle-preview",
            ["shift-down"] = "preview-page-down",
            ["shift-up"]   = "preview-page-up",
        },
    },
    actions             = {
        files = {
            ["default"] = actions.file_edit_or_qf,
            ["ctrl-s"]  = actions.file_split,
            ["ctrl-v"]  = actions.file_vsplit,
            ["ctrl-t"]  = actions.file_tabedit,
            ["alt-q"]   = actions.file_sel_to_qf,
        },
        buffers = {
            ["default"] = actions.buf_edit,
            ["ctrl-s"]  = actions.buf_split,
            ["ctrl-v"]  = actions.buf_vsplit,
            ["ctrl-t"]  = actions.buf_tabedit,
        }
    },
    fzf_opts            = {
        ['--ansi']   = '',
        ['--prompt'] = '> ',
        ['--info']   = 'inline',
        ['--height'] = '100%',
        ['--layout'] = 'reverse',
    },
    previewers          = {
        cat = {
            cmd  = "cat",
            args = "--number",
        },
        bat = {
            cmd    = "bat",
            args   = "--style=numbers,changes --color always",
            theme  = 'Coldark-Dark', -- bat preview theme (bat --list-themes)
            config = nil, -- nil uses $BAT_CONFIG_PATH
        },
        head = {
            cmd  = "head",
            args = nil,
        },
        git_diff = {
            cmd_deleted   = "git diff --color HEAD --",
            cmd_modified  = "git diff --color HEAD",
            cmd_untracked = "git diff --color --no-index /dev/null",
            -- pager        = "delta",      -- if you have `delta` installed
        },
        man = {
            -- NOTE: remove the `-c` flag when using man-db
            cmd = "man -c %s | col -bx",
        },
        builtin = {
            syntax         = true, -- preview syntax highlight?
            syntax_limit_l = 0, -- syntax limit (lines), 0=nolimit
            syntax_limit_b = 1024 * 1024, -- syntax limit (bytes), 0=nolimit
            limit_b        = 1024 * 1024 * 10, -- preview limit (bytes), 0=nolimit

            extensions      = {
                -- neovim terminal only supports `viu` block output
                ["png"] = { "viu", "-b" },
                ["jpg"] = { "ueberzug" },
            },
            ueberzug_scaler = "cover",
        },
    },
    -- provider setup
    files               = {
        -- previewer      = "bat",          -- uncomment to override previewer
        -- (name from 'previewers' table)
        -- set to 'false' to disable
        prompt       = 'Files❯ ',
        multiprocess = true, -- run command in a separate process
        git_icons    = true, -- show git icons?
        file_icons   = true, -- show file icons?
        color_icons  = true, -- colorize file|git icons

        find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
        rg_opts   = "--color=never --files --follow -g '!.git' -g '!go/' -g '!*.class' -g '!*.pdf' -g '!VirtualBox*' -g '!node_modules*'",
        fd_opts   = "--color=never --type f --follow --exclude .git",
        actions   = {
            ["default"] = actions.file_edit,
            ["ctrl-y"]  = function(selected) print(selected[1]) end,

        }
    },
    git                 = {
        files = {
            prompt       = 'GitFiles❯ ',
            cmd          = 'git ls-files --exclude-standard',
            multiprocess = true, -- run command in a separate process
            git_icons    = true, -- show git icons?
            file_icons   = true, -- show file icons?
            color_icons  = true, -- colorize file|git icons
        },
        status = {
            prompt      = 'GitStatus❯ ',
            cmd         = "git status -s",
            previewer   = "git_diff",
            file_icons  = true,
            git_icons   = true,
            color_icons = true,
            actions     = {
                -- actions inherit from 'actions.files' and merge
                ["right"] = { actions.git_unstage, actions.resume },
                ["left"]  = { actions.git_stage, actions.resume },
            },
        },
        commits = {
            prompt  = 'Commits❯ ',
            cmd     = "git log --pretty=oneline --abbrev-commit --color",
            preview = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
            actions = {
                ["default"] = actions.git_checkout,
            },
        },
        bcommits = {
            prompt  = 'BCommits❯ ',
            cmd     = "git log --pretty=oneline --abbrev-commit --color",
            preview = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
            actions = {
                ["default"] = actions.git_buf_edit,
                ["ctrl-s"]  = actions.git_buf_split,
                ["ctrl-v"]  = actions.git_buf_vsplit,
                ["ctrl-t"]  = actions.git_buf_tabedit,
            },
        },
        branches = {
            prompt  = 'Branches❯ ',
            cmd     = "git branch --all --color",
            preview = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
            actions = {
                ["default"] = actions.git_switch,
            },
        },
        icons = {
            ["M"] = { icon = "✗", color = "red" },
            ["D"] = { icon = "★", color = "red" },
            ["A"] = { icon = "+", color = "green" },
            ["R"] = { icon = "R", color = "yellow" },
            ["C"] = { icon = "C", color = "yellow" },
            ["?"] = { icon = "👀", color = "magenta" },
            -- override git icons?
        },
    },
    grep                = {
        prompt       = 'Rg❯ ',
        input_prompt = 'Grep For❯ ',
        multiprocess = true, -- run command in a separate process
        git_icons    = true, -- show git icons?
        file_icons   = true, -- show file icons?
        color_icons  = true, -- colorize file|git icons
        -- executed command priority is 'cmd' (if exists)
        -- otherwise auto-detect prioritizes `rg` over `grep`
        -- default options are controlled by 'rg|grep_opts'
        -- cmd            = "rg --vimgrep",
        grep_opts    = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp",
        rg_opts      = "--column --line-number --no-heading --color=always --smart-case --max-columns=512",
        rg_glob      = false, -- default to glob parsing?

        glob_flag      = "--iglob", -- for case sensitive globs use '--glob'
        glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
        actions        = {
            ["ctrl-g"] = { actions.grep_lgrep }
        },
        no_header      = false, -- hide grep|cwd header?
        no_header_i    = false, -- hide interactive header?
    },
    args                = {
        prompt     = 'Args❯ ',
        files_only = true,
        actions    = { ["ctrl-x"] = { actions.arg_del, actions.resume } }
    },
    oldfiles            = {
        prompt                  = 'History❯ ',
        cwd_only                = false,
        stat_file               = true, -- verify files exist on disk
        include_current_session = false, -- include bufs from current session
    },
    buffers             = {
        prompt        = 'Buffers❯ ',
        file_icons    = true, -- show file icons?
        color_icons   = true, -- colorize file|git icons
        sort_lastused = true, -- sort buffers() by last used
        actions       = {
            ["ctrl-x"] = { actions.buf_del, actions.resume },
        }
    },
    tabs                = {
        prompt      = 'Tabs❯ ',
        tab_title   = "Tab",
        tab_marker  = "<<",
        file_icons  = true, -- show file icons?
        color_icons = true, -- colorize file|git icons
        actions     = {
            -- actions inherit from 'actions.buffers' and merge
            ["default"] = actions.buf_switch,
            ["ctrl-x"]  = { actions.buf_del, actions.resume },
        },
        fzf_opts    = {
            -- hide tabnr
            ['--delimiter'] = "'[\\):]'",
            ["--with-nth"]  = '2..',
        },
    },
    lines               = {
        previewer       = "builtin", -- set to 'false' to disable
        prompt          = 'Lines❯ ',
        show_unlisted   = false, -- exclude 'help' buffers
        no_term_buffers = true, -- exclude 'term' buffers
        fzf_opts        = {
            ['--delimiter'] = "'[\\]:]'",
            ["--nth"]       = '2..',
            ["--tiebreak"]  = 'index',
        },
        -- actions inherit from 'actions.buffers'
    },
    blines              = {
        previewer       = "builtin", -- set to 'false' to disable
        prompt          = 'BLines❯ ',
        show_unlisted   = true, -- include 'help' buffers
        no_term_buffers = false, -- include 'term' buffers
        fzf_opts        = {
            -- hide filename, tiebreak by line no.
            ['--delimiter'] = "'[\\]:]'",
            ["--with-nth"]  = '2..',
            ["--tiebreak"]  = 'index',
        },
        -- actions inherit from 'actions.buffers'
    },
    tags                = {
        prompt       = 'Tags❯ ',
        ctags_file   = "tags",
        multiprocess = true,
        file_icons   = true,
        git_icons    = true,
        color_icons  = true,

        rg_opts     = "--no-heading --color=always --smart-case",
        grep_opts   = "--color=auto --perl-regexp",
        actions     = {
            ["ctrl-g"] = { actions.grep_lgrep }
        },
        no_header   = false, -- hide grep|cwd header?
        no_header_i = false, -- hide interactive header?
    },
    btags               = {
        prompt       = 'BTags❯ ',
        ctags_file   = "tags",
        multiprocess = true,
        file_icons   = true,
        git_icons    = true,
        color_icons  = true,
        rg_opts      = "--no-heading --color=always",
        grep_opts    = "--color=auto --perl-regexp",
        fzf_opts     = {
            ['--delimiter'] = "'[\\]:]'",
            ["--with-nth"]  = '2..',
            ["--tiebreak"]  = 'index',
        },
    },
    colorschemes        = {
        prompt        = 'Colorschemes❯ ',
        live_preview  = true, -- apply the colorscheme on preview?
        actions       = { ["default"] = actions.colorscheme, },
        winopts       = { height = 0.55, width = 0.30, },
        post_reset_cb = function()
        end,
    },
    quickfix            = {
        file_icons = true,
        git_icons  = true,
    },
    lsp                 = {
        prompt_postfix   = '❯ ', -- will be appended to the LSP label
        -- to override use 'prompt' instead
        cwd_only         = false, -- LSP/diagnostics for cwd only?
        async_or_timeout = 5000, -- timeout(ms) or 'true' for async calls
        file_icons       = true,
        git_icons        = false,
        lsp_icons        = true,
        ui_select        = true, -- use 'vim.ui.select' for code actions
        severity         = "hint",
        icons            = {
            ["Error"]       = { icon = "", color = "red" }, -- error
            ["Warning"]     = { icon = "", color = "yellow" }, -- warning
            ["Information"] = { icon = "", color = "blue" }, -- info
            ["Hint"]        = { icon = "", color = "magenta" }, -- hint
        },
    },
    file_icon_padding   = '',
    file_icon_colors    = {
        ["lua"] = "blue",
    },
}
