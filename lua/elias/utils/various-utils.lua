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

-- personal replace for VimWiki
require('mkdnflow').setup({
    modules = {
        bib = true,
        buffers = true,
        conceal = true,
        cursor = true,
        folds = true,
        links = true,
        lists = true,
        maps = true,
        paths = true,
        tables = true
    },
    filetypes = { md = true, rmd = true, markdown = true },
    create_dirs = true,
    perspective = {
        priority = 'root',
        fallback = 'current',
        root_tell = 'index.md',
        nvim_wd_heel = true
    },
    wrap = false,
    bib = {
        default_path = '~/.local/share/vimwiki/',
        find_in_root = true
    },
    silent = false,
    links = {
        style = 'markdown',
        conceal = false,
        implicit_extension = nil,
        transform_implicit = false,
        transform_explicit = function(text)
            text = text:gsub(" ", "-")
            text = text:lower()
            text = os.date('%Y-%m-%d_') .. text
            return (text)
        end
    },
    to_do = {
        symbols = { ' ', '-', 'X' },
        update_parents = true,
        not_started = ' ',
        in_progress = '-',
        complete = 'X'
    },
    tables = {
        trim_whitespace = true,
        format_on_move = true,
        auto_extend_rows = false,
        auto_extend_cols = false
    },
})

--[[ require('kommentary.config').configure_language('typescriptreact', {
    single_line_comment_string = 'auto',
    multi_line_comment_strings = 'auto',
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end,
}) ]]
