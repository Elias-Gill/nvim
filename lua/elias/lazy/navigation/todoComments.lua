return {
    "folke/todo-comments.nvim",
    event = { "VeryLazy" },
    opts = {
        gui_style = {
            fg = "ITALIC",
            bg = "ITALIC",
        },
        signs = true,      -- show icons in the signs column
        sign_priority = 8, -- sign priority
        keywords = {
            FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "REFACTOR" } },
            HACK = { icon = " ", color = "warning", alt = { "VER", "LOOK" } },
            TODO = { icon = " ", color = "info", alt = { "TAREA" } },
            PERF = { icon = "🗲 ", color = "performance", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { icon = "🛈 ", color = "hint", alt = { "INFO", "HINT" } },
            FUTURE = { icon = "⏳", color = "future", alt = { "COMING", "ROADMAP" } },
            REVIEW = { icon = "▼ ", color = "review", alt = { "AUDIT" } },
        },
        merge_keywords = true,
        highlight = {
            keyword = "wide_fg",
            after = "fg",
            before = "",
            pattern = [[.*<(KEYWORDS):\s*]], -- pattern or table of patterns
            comments_only = true,
            max_line_len = 400,
            exclude = {},
            multiline = true, -- enable multine todo comments
        },
        colors = {
            error = "#f02020",
            warning = "#ffd500",
            info = "#A0D6DB",
            hint = "#00ec89",
            performance = "#8f3AED",
            review = "#09587f",
            future = "#ffdfff",
        },
        search = {
            pattern = [[\b(KEYWORDS)]], -- ripgrep regex
        },
    },
}
