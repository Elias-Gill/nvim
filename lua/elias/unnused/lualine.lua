require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'horizon',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diagnostics' },
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 0,
                shorting_target = 40,
                symbols = {
                    modified = '  💽',
                    readonly = ' [🔑]',
                    unnamed = '[No Name]',
                }
            }
        },

        lualine_x = { 'filetype', 'fileformat', 'encoding' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_b = { {
            'tabs',
            mode = 1,
            max_length = vim.o.columns / 1, -- maximum width of tabs component
        } }
    },
    extensions = { 'nvim-tree', 'fugitive' }
}
