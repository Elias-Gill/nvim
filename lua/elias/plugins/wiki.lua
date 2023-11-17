local function mkdConfig()
    -- personal replace for VimWiki
    require("mkdnflow").setup({
        modules = {
            buffers = true,
            tables = true,
            folds = true,
            links = true,
            lists = true,
            paths = true,
            maps = true, -- keymaps
            conceal = false,
            cursor = false,
            bib = false,
        },
        filetypes = { markdown = true },
        create_dirs = true,
        perspective = {
            priority = "root",
            fallback = "current",
            root_tell = "index.md",
            nvim_wd_heel = false,
        },
        wrap = false,
        silent = true,
        lists = {
            conceal = true
        },
        links = {
            style = "markdown",
            conceal = true,
            implicit_extension = nil,
            transform_explicit = false,
            transform_implicit = false,
        },
        to_do = {
            symbols = { " ", "-", "X" },
            update_parents = true,
            not_started = " ",
            in_progress = "-",
            complete = "X",
        },
        tables = {
            trim_whitespace = true,
            format_on_move = true,
            auto_extend_rows = true,
            auto_extend_cols = true,
        },
    })
end

return {
    -- lazy config
    {
        "jakewvincent/mkdnflow.nvim",
        ft = { "markdown" },
        dependencies = {
            'elias-gill/vim-markdown-concealed',
            -- 'ellisonleao/glow.nvim',
        },
        config = mkdConfig
    },
}
