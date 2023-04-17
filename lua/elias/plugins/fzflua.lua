return {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    config = function()
        local utils = require("fzf-lua").utils
        local function hl_validate(hl)
            return not utils.is_hl_cleared(hl) and hl or nil
        end
        require("fzf-lua").setup({
            winopts    = {
                width      = 0.8,
                height     = 0.9,
                preview    = {
                    hidden       = "nohidden",
                    vertical     = "up:45%",
                    horizontal   = "right:50%",
                    layout       = "flex",
                    flip_columns = 120,
                },
                hl         = {
                    normal       = hl_validate "TelescopeNormal",
                    border       = hl_validate "TelescopeBorder",
                    help_normal  = hl_validate "TelescopeNormal",
                    help_border  = hl_validate "TelescopeBorder",
                    -- builtin preview only
                    cursor       = hl_validate "Cursor",
                    cursorline   = hl_validate "TelescopePreviewLine",
                    cursorlinenr = hl_validate "TelescopePreviewLine",
                    search       = hl_validate "IncSearch",
                    title        = hl_validate "TelescopeTitle",
                },
                row        = 0.35,
                col        = 0.50,
                border     = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                fullscreen = false,
            },
            fzf_colors = {
                ["fg"] = { "fg", "TelescopeNormal" },
                ["bg"] = { "bg", "TelescopeNormal" },
                ["hl"] = { "fg", "TelescopeMatching" },
                ["fg+"] = { "fg", "TelescopeSelection" },
                ["bg+"] = { "bg", "TelescopeSelection" },
                ["hl+"] = { "fg", "TelescopeMatching" },
                ["info"] = { "fg", "TelescopeMultiSelection" },
                ["border"] = { "fg", "TelescopeBorder" },
                ["gutter"] = { "bg", "TelescopeNormal" },
                ["prompt"] = { "fg", "TelescopePromptPrefix" },
                ["pointer"] = { "fg", "TelescopeSelectionCaret" },
                ["marker"] = { "fg", "TelescopeSelectionCaret" },
                ["header"] = { "fg", "TelescopeTitle" },
            },
            fzf_opts   = { ["--layout"] = "default",["--marker"] = "+", ["--algo"] = "v1" },
            -- provider setup
            files      = {
                previewer   = {
                    syntax          = true,
                    extensions      = {
                        ["png"] = { "ueberzug" },
                        ["jpg"] = { "ueberzug" },
                    },
                    ueberzug_scaler = "fit_contain",
                },
                git_icons   = false,
                file_icons  = true,
                color_icons = true,
                rg_opts     =
                "--color=never --files --follow -g '!.git' -g '!go/' -g '!*.class' -g '!facultad' -g '!VirtualBox*' -g '!node_modules*'",
                fd_opts     =
                "--color=never --type f --follow --exclude .git --exclude *.class --exclude facultad/ --exclude node_modules/ --exclude go/",
            },
            -- config de grep
            grep       = {
                rg_opts =
                "--column --line-number --no-heading --color=always --smart-case --max-columns=512 -g '!.git' -g '!go/' -g '!*.class' -g '!facultad' -g '!VirtualBox*' -g '!node_modules*'",
            },
            -- config de live_grep
            live_grep  = {
                rg_opts =
                "--column --line-number --no-heading --color=always --smart-case --max-columns=512 -g '!.git' -g '!go/' -g '!*.class' -g '!facultad' -g '!VirtualBox*' -g '!node_modules*'"
            },
        })
    end
}
