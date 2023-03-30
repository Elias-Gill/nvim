return {
    "glepnir/lspsaga.nvim",
    cmd = "Lspsaga",
    config = function()
        require("lspsaga").setup({
            lightbulb = {
                enable = false,
                sign = false,
                enable_in_insert = false,
                sign_priority = 2,
                virtual_text = false,
            },
            symbol_in_winbar = {
                enable = false,
            },
            ui = {
                -- currently only round theme
                theme = "round",
                -- border type can be single,double,rounded,solid,shadow.
                border = "single",
                winblend = 0,
                expand = "",
                collapse = "",
                preview = " ",
                diagnostic = "🐞",
                incoming = " ",
                outgoing = " ",
                colors = {
                    --float window normal bakcground color
                    normal_bg = "#1c1c19",
                    --title background color
                    title_bg = "#eeeeee",
                    red = "#e95678",
                    magenta = "#b33076",
                    orange = "#FF8700",
                    yellow = "#f7bb3b",
                    green = "#afd700",
                    cyan = "#36d0e0",
                    blue = "#61afef",
                    purple = "#CBA6F7",
                    white = "#d1d4cf",
                    black = "#1c1c19",
                },
                kind = {},
            },
        })
    end
}
