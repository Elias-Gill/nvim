local function config()
    require('dressing').setup({
        input = {
            -- Can be 'left', 'right', or 'center'
            title_pos = "center",
            -- These are passed to nvim_open_win
            anchor = "SW",
            border = "single",
            win_options = {
                winblend = 10, --transparency (0-100)
                sidescrolloff = 2,
            },
        },
        select = {
            -- Priority list of preferred vim.select implementations
            backend = { "telescope", "fzf_lua", "builtin", "nui" },
            -- Options for built-in selector
            builtin = {
                border = "single",
            },
            trim_prompt = false,
        },
    })
end
return {
    'stevearc/dressing.nvim',
    config = config
}
