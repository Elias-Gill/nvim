local function mkdConfig()
    -- personal replace for VimWiki
    require("mkdnflow").setup({
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
            tables = true,
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
        bib = {
            default_path = "~/.local/share/vimwiki/",
            find_in_root = false,
        },
        silent = false,
        links = {
            style = "markdown",
            conceal = false,
            implicit_extension = nil,
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
            { "ellisonleao/glow.nvim",
                branch = "main",
                config = function()
                    require("glow").setup({})
                end,
            },
            'prurigro/vim-markdown-concealed'
        },
        config = mkdConfig
    },
}
