return {
    'echasnovski/mini.files',
    version = false,
    config = function()
        require 'mini.files'.setup({
            -- Customization of shown content
            content = {
                filter = function(fs_entry)
                    return not vim.startswith(fs_entry.name, '.')
                end,
            },
            options = {
                use_as_default_explorer = true,
            },
            windows = {
                max_number = 12,
                preview = true,
                width_focus = 50,
                width_nofocus = 15,
                width_preview = 25,
            },
        })
    end
}
