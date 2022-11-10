require("todo-comments").setup {
    signs = true, -- show icons in the signs column
    sign_priority = 8, -- sign priority
    keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, },
        TODO = { icon = " ", color = "info", alt = { "TAREA" } },
        HACK = { icon = " ", color = "warning", alt = { "VER", "LOOK" } },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO", "NOTE", "HINT" } },
        FUTURE = { icon = "🚀", color = "future", alt = { "FUTURE", "COMING", "HINT" } },
    },
    merge_keywords = true,
    highlight = {
        before = "",
        keyword = "wide",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns
        comments_only = true,
        max_line_len = 400,
        exclude = {},
        multiline = false, -- enable multine todo comments
    },
    colors = {
        error = { "#f02020" },
        warning = { "#ffd500" },
        info = { "#2583EB" },
        hint = { "#00ec89" },
        default = { "#8f3AED" },
        future = { "#ffdfff" },
    },
    search = {
        command = "rg",
        args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
        },
        pattern = [[\b(KEYWORDS)]], -- ripgrep regex
    },
}
-- TODO  aslkdjalskdalskdj
-- INFO  aslkdjalskdj
-- WARN  alskdalskdj
-- BUG  alskdjalskjlaskdj
-- PERF  alskdjalskdjalskdlaskdj
-- FUTURE  laskdjlaskdjlksadj
