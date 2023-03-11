local function tsConfig()
    --treesitter
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "markdown", "markdown_inline", "c", "lua", "javascript", "go", "python", "bash", "java", "css", "json", "dockerfile" },
        sync_install = false,
        ignore_install = {},
        indent = { enable = true },
        highlight = {
            enable = true,
            disable = {},
            additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
        -- treesitter object mappings configuration
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ib"] = "@block.inner",
                    ["ab"] = "@block.outer",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["at"] = "@tag.outer",
                    ["it"] = "@tag.inner",
                    ["aP"] = "@parameter.outer",
                    ["iP"] = "@parameter.inner",
                },
            },
        },
        -- change comment style for embeded languages
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
    })
end

return {
    -- Tree sitter
    {
        "nvim-treesitter/nvim-treesitter",
        config = tsConfig,
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },
    -- ts playground
    {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
        config = function()
            require("nvim-treesitter.configs").setup({})
        end,
    },
}
