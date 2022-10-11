require("indent_blankline").setup {
    show_current_context = true,
    -- show_current_context_start = true,
}

require('nvim-autopairs').setup({
    enable_check_bracket_line = false
})

require("focus").setup({
    excluded_buftypes = { "NvimTree" },
    signcolumn = false,
    -- enable = false
})
vim.cmd("FocusDisable")

--[[ require('kommentary.config').configure_language('typescriptreact', {
    single_line_comment_string = 'auto',
    multi_line_comment_strings = 'auto',
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end,
}) ]]
