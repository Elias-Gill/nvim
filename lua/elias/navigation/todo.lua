require("todo-comments").setup {
    signs = true, -- show icons in the signs column
    sign_priority = 8, -- sign priority
    keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, },
        TODO = { icon = " ", color = "info", alt = {"TAREA"} },
        HACK = { icon = " ", color = "warning", alt = {"VER", "LOOK"}},
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX"} },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE"} },
        NOTE = { icon = " ", color = "hint", alt = { "INFO", "NOTE", "HINT" } },
    },
    merge_keywords = true,
    highlight = {
        before = "",
        keyword = "wide",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s]],
        comments_only = true,
        max_line_len = 400,
        exclude = {},
    },
    colors = {
        error = { "DiagnosticError", "ErrorMsg", "#FF1B1E" },
        warning = { "DiagnosticWarning", "WarningMsg", "#FF861B" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
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
