-- Tabline and status bar
return {
    {
        -- tabline
        "alvarosevilla95/luatab.nvim",
        event = "TabNew",
        config = function()
            -- tabline personalizada con iconos
            require("luatab").setup({
                separator = function()
                    return ""
                end,
                modified = function(bufnr)
                    return vim.fn.getbufvar(bufnr, "&modified") == 1 and "+ " or ""
                end,
                windowCount = function()
                    return ""
                end,
            })
        end
    },
    -- status line
    {
        "windwp/windline.nvim",
        config = function()

            local mi_contador_lineas = function(_, _, _, _)
                local row = unpack(vim.api.nvim_win_get_cursor(0))
                local lines = vim.api.nvim_buf_line_count(0)
                return string.format(' %3s:%-2s ', row, lines)
            end
            local windline = require('windline')
            local helper = require('windline.helpers')
            local b_components = require('windline.components.basic')
            local state = _G.WindLine.state

            local lsp_comps = require('windline.components.lsp')
            local git_comps = require('windline.components.git')

            local hl_list = {
                Black = { 'white', 'black' },
                White = { 'black', 'white' },
                Inactive = { 'InactiveFg', 'InactiveBg' },
                Active = { 'ActiveFg', 'ActiveBg' },
            }
            local basic = {}

            local breakpoint_width = 90
            basic.divider = { b_components.divider, '' }
            basic.bg = { ' ', 'StatusLine' }
            local colors_mode = {
                Normal = { 'red', 'black' },
                Insert = { 'green', 'black' },
                Visual = { 'yellow', 'black' },
                Replace = { 'blue_light', 'black' },
                Command = { 'magenta', 'black' },
            }
            basic.vi_mode = {
                name = 'vi_mode',
                hl_colors = colors_mode,
                text = function()
                    return { { '  ', state.mode[2] } }
                end,
            }
            basic.square_mode = {
                hl_colors = colors_mode,
                text = function()
                    return { { '▊', state.mode[2] } }
                end,
            }
            basic.lsp_diagnos = {
                name = 'diagnostic',
                hl_colors = {
                    red = { 'red', 'black' },
                    yellow = { 'yellow', 'black' },
                    blue = { 'blue', 'black' },
                },
                width = breakpoint_width,
                text = function(bufnr)
                    if lsp_comps.check_lsp(bufnr) then
                        return {
                            { lsp_comps.lsp_error({ format = '  %s', show_zero = true }),   'red' },
                            { lsp_comps.lsp_warning({ format = '  %s', show_zero = true }), 'yellow' },
                            { lsp_comps.lsp_hint({ format = '  %s', show_zero = true }),    'blue' },
                        }
                    end
                    return ''
                end,
            }
            basic.file = {
                name = 'file',
                hl_colors = {
                    default = hl_list.Black,
                    white = { 'white', 'black' },
                    magenta = { 'magenta', 'black' },
                },
                text = function(_, _, width)
                    if width > breakpoint_width then
                        return {
                            { ' ',                                                 '' },
                            { b_components.cache_file_name('[No Name]', 'unique'), 'magenta' },
                            { mi_contador_lineas,                           'white' },
                            { b_components.progress_lua,                           '' },
                            { ' ',                                                 '' },
                            { b_components.file_modified(' '),                  'magenta' },
                        }
                    else
                        return {
                            { b_components.cache_file_size(),                      'default' },
                            { ' ',                                                 '' },
                            { b_components.cache_file_name('[No Name]', 'unique'), 'magenta' },
                            { ' ',                                                 '' },
                            { b_components.file_modified(' '),                  'magenta' },
                        }
                    end
                end,
            }
            basic.file_right = {
                hl_colors = {
                    default = hl_list.Black,
                    white = { 'white', 'black' },
                    magenta = { 'magenta', 'black' },
                },
                text = function(_, _, width)
                    if width < breakpoint_width then
                        return {
                            { mi_contador_lineas,        'white' },
                            { b_components.progress_lua, '' },
                        }
                    end
                end,
            }
            basic.git = {
                name = 'git',
                hl_colors = {
                    green = { 'yellow', 'black' },
                    red = { 'red', 'black' },
                    blue = { 'blue', 'black' },
                },
                width = breakpoint_width,
                text = function(bufnr)
                    if git_comps.is_git(bufnr) then
                        return {
                            { git_comps.diff_added({ format = '  %s', show_zero = true }),   'green' },
                            { git_comps.diff_removed({ format = '  %s', show_zero = true }), 'red' },
                            { git_comps.diff_changed({ format = ' ? %s', show_zero = true }),  'blue' },
                        }
                    end
                    return ''
                end,
            }
            local quickfix = {
                filetypes = { 'qf', 'Trouble' },
                active = {
                    { '🚦 Quickfix ',              { 'white', 'black' } },
                    { helper.separators.slant_right, { 'black', 'black_light' } },
                    {
                        function()
                            return vim.fn.getqflist({ title = 0 }).title
                        end,
                        { 'cyan', 'black_light' },
                    },
                    { ' Total : %L ',                { 'cyan', 'black_light' } },
                    { helper.separators.slant_right, { 'black_light', 'InactiveBg' } },
                    { ' ',                           { 'InactiveFg', 'InactiveBg' } },
                    basic.divider,
                    { helper.separators.slant_right, { 'InactiveBg', 'black' } },
                    { '🧛 ',                       { 'white', 'black' } },
                },
                always_active = true,
                show_last_status = true,
            }
            local explorer = {
                filetypes = { 'fern', 'NvimTree', 'lir', 'vimspector.Watches', 'vimspector.Variales' },
                active = {
                    { '  ',                       { 'black', 'red' } },
                    { helper.separators.slant_right, { 'red', 'NormalBg' } },
                    { b_components.divider,          '' },
                    { b_components.file_name(''), { 'white', 'NormalBg' } },
                },
                always_active = true,
                show_last_status = true,
            }
            basic.lsp_name = {
                width = breakpoint_width,
                name = 'lsp_name',
                hl_colors = {
                    magenta = { 'magenta', 'black' },
                },
                text = function(bufnr)
                    if lsp_comps.check_lsp(bufnr) then
                        return {
                            { b_components.cache_file_type({ icon = true }), 'magenta' },
                            { '  ' },
                            { lsp_comps.lsp_name(),                          'magenta' },
                        }
                    end
                    return {
                        { b_components.cache_file_type({ icon = true }), 'magenta' },
                    }
                end,
            }
            basic.file_inactive = {
                name = 'file',
                hl_colors = {
                    default = hl_list.Black,
                    white = { 'white', 'black' },
                    magenta = { 'magenta', 'black' },
                },
                text = function(_, _, width)
                    if width > breakpoint_width then
                        return {
                            { ' ',                                                 '' },
                            { b_components.cache_file_name('[No Name]', 'unique'), 'magenta' },
                            { ' ',                                                 '' },
                        }
                    else
                        return {
                            { b_components.cache_file_size(),                      'default' },
                            { ' ',                                                 '' },
                            { b_components.cache_file_name('[No Name]', 'unique'), 'magenta' },
                            { ' ',                                                 '' },
                        }
                    end
                end,
            }
            local default = {
                filetypes = { 'default' },
                active = {
                    basic.square_mode,
                    basic.vi_mode,
                    basic.git,
                    { git_comps.git_branch(), { 'magenta', 'black' }, breakpoint_width },
                    { ' ',                    hl_list.Black },
                    basic.divider,
                    basic.lsp_diagnos,
                    basic.file,
                    basic.divider,
                    basic.file_right,
                    basic.lsp_name,
                    { ' ' },
                    basic.square_mode,
                },
                inactive = {
                    basic.lsp_name,
                    basic.divider,
                    basic.file_inactive,
                    basic.divider,
                    { mi_contador_lineas,    hl_list.Inactive },
                    { b_components.progress, hl_list.Inactive },
                },
            }
            windline.setup({
                colors_name = function(colors)
                    return colors
                end,
                statuslines = {
                    default,
                    quickfix,
                    explorer,
                },
            })
        end
    },
}
