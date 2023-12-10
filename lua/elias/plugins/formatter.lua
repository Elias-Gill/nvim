-- INFO: FOR LINTING use: 'https://github.com/mfussenegger/nvim-lint'
return {
    'stevearc/conform.nvim',
    -- event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "=f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = { "n", "v" },
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "isort", "black" },
            bash = { "shfmt" },
            markdown = { "mdformat" },
            sh = { "shfmt" },
            -- Use a sub-list to run only the first available formatter
            javascript = { { "prettierd", "prettier" } },
            typescript = { { "prettierd", "prettier" } },
            javascriptreact = { { "prettierd", "prettier" } },
            astro = { { "prettierd", "prettier" } },
        }
    },
}
