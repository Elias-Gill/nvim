-- general plugins without further customization
return {
    "nvim-lua/plenary.nvim",

    -- free copilot
    {
        "Exafunction/codeium.vim",
        cmd = "Codeium",
        config = function()
            vim.cmd([[
                let g:codeium_disable_bindings = 1
                imap <script><silent><nowait><expr> <C-l> codeium#Accept()
                imap <C-x>   <Cmd>call codeium#Clear()<CR>
                ]])
        end
    },

    -- coconut oil navigation
    { "ThePrimeagen/harpoon",      event = "BufAdd" },
    "christoomey/vim-tmux-navigator",

    -- VISUALS --
    -- colorschemes
    {
        'projekt0n/caret.nvim',
        lazy = true,
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('caret').setup({
                options = {
                    transparent = true,
                },
                groups = {
                    ["SignColumn"] = { bg = "none" },
                },
            })
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        event = "UIEnter",
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                transparent_background = true,
                custom_highlights = function(_)
                    return {
                        ["NvimTreeCursorLine"] = { bg = "#323232", style = { "italic" } },
                        ["CursorLine"] = { bg = "#343434" },
                    }
                end
            })
            vim.cmd.colorscheme("catppuccin")
        end
    },

    -- Fonts and icons
    "ryanoasis/vim-devicons",
    "nvim-tree/nvim-web-devicons",

    --     Utilities    --
    { "kevinhwang91/rnvimr",       cmd = "RnvimrToggle" },                                      -- ranger file manager integration
    { "kevinhwang91/nvim-bqf",     ft = "qf" },                                                 -- better quickfixList
    { "tpope/vim-repeat",          event = "InsertEnter" },
    { "roblillack/vim-bufferlist", keys = { { "<leader>bl", "<cmd>call BufferList()<cr>" } } }, -- list my buffers
    { "tpope/vim-surround",        event = { "InsertEnter", "BufEnter" } },                     -- surround
    { "szw/vim-maximizer",         cmd = "MaximizerToggle" },                                   -- maximizer
    { "josa42/nvim-gx",            keys = { { "gx", "<cmd>lua require('gx').gx()" } } },        -- open urls

    -- cleaning buffers
    {
        "kazhala/close-buffers.nvim",
        cmd = "Bwipeout",
        config = function()
            require('close_buffers').setup()
        end
    },
    -- undotree
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        config = function()
            vim.g.undotree_WindowLayout = 3
        end
    },
    -- zen mode
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                options = {
                    signcolumn = "no",
                    number = false,
                    relativenumber = false,
                },
            },
        },
        cmd = "ZenMode"
    },
    -- colorizer
    {
        'NvChad/nvim-colorizer.lua',
        event = { "BufEnter", "BufAdd" },
        config = function()
            require('colorizer').setup()
        end
    },

    -- Pareado (){}""''
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                enable_check_bracket_line = false,
            })
        end,
    },
    --ayudas de indentacion
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "UIEnter",
        opts = {
            show_current_context = true,
            filetype_exclude = { "dashboard", "startify", "vim", "markdown", "txt" },
            char_list = { '┆' },
            context_char = '┆',
            use_treesitter = true
        }
    },
    --comentarios
    {
        "numToStr/Comment.nvim",
        event = "BufEnter",
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
                ---@diagnostic disable-next-line: missing-fields
                mappings = {
                    extra = false,
                },
            })
        end,
    },
}
