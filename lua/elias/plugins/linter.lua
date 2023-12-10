return {
    "mfussenegger/nvim-lint",
    event = "BufWritePost",
    config = function()
        require('lint').linters_by_ft = {
            -- markdown = { 'vale', },
            javascript = { 'eslint_d', },
            typescript = { 'eslint_d', },
            typescriptreact = { 'eslint_d', },
            javascriptreact = { 'eslint_d', },
            astro = { 'eslint_d', },
            svelte = { 'eslint_d', },
            vue = { 'eslint_d', },
            lua = { 'luacheck', },
            golang = { 'golangcilint', },
            go = { 'golangcilint', },
            git = { 'gitlint', },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end
}
