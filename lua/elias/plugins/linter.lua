return {
    "mfussenegger/nvim-lint",
    event = "BufWritePost",
    config = function()
        require('lint').linters_by_ft = {
            markdown = { 'vale', },
            javascript = { 'eslint_d', },
            lua = { 'luacheck', }
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end
}
