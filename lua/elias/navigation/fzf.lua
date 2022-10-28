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
        preview    = {
            border       = 'border',
            wrap         = 'nowrap',
            hidden       = 'nohidden',
            vertical     = 'up:65%',
            horizontal   = 'right:50%',
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
    },
    fzf_opts            = {
        ['--ansi']   = '',
        ['--prompt'] = '> ',
        ['--info']   = 'inline',
        ['--height'] = '100%',
        ['--layout'] = 'default',
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
    grep                = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512 -g '!.git' -g '!go/' -g '!*.class' -g '!*.pdf' -g '!VirtualBox*' -g '!node_modules*'",
    },
    file_icon_padding   = '',
    file_icon_colors    = {
        ["lua"] = "blue",
    },
}
