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
    {
        "ThePrimeagen/harpoon",
        event = "BufAdd",
    },
    "christoomey/vim-tmux-navigator",
    -- use 'ThePrimeagen/refactoring.nvim'
    -- { 'ThePrimeagen/git-worktree.nvim', config = function()
    --     require("git-worktree").setup({})
    -- end },

    -- File explorers
    { "kevinhwang91/rnvimr",       cmd = "RnvimrToggle" },

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
                custom_highlights = function(colors)
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

    -- Utilities
    { "kevinhwang91/nvim-bqf",     ft = "qf" }, -- better quickfixList
    { "tpope/vim-repeat",          event = "InsertEnter" },
    { "mbbill/undotree",           cmd = "UndotreeToggle" },
    { "roblillack/vim-bufferlist", keys = { { "<leader>bl", "<cmd>call BufferList()<cr>" } } },
    { "tpope/vim-surround",        event = { "InsertEnter", "BufEnter" } },
    { "szw/vim-maximizer",         cmd = "MaximizerToggle" },
    { "Asheq/close-buffers.vim",   cmd = "Bwipeout" },
    { "josa42/nvim-gx",            keys = { { "gx", "<cmd>lua require('gx').gx()" } } }, -- open urls
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                options = {
                    signcolumn = "no",      -- disable signcolumn
                    number = false,         -- disable number column
                    relativenumber = false, -- disable relative numbers
                },
            },
        },
        cmd = "ZenMode"
    },
    {
        'NvChad/nvim-colorizer.lua',
        event = { "BufEnter", "BufAdd" },
        config = function()
            require('colorizer').setup()
        end
    },

    -- "Super-completado html
    {
        "mattn/emmet-vim",
        ft = { "html", "css", "svelte", "javascript", "javascriptreact", "vue", "typescript", "typescriptreact", "astro" },
        config = function()
            vim.api.nvim_command(
                [[autocmd FileType svelte,html,css,javascript,javascriptreact,vue,typescript,typescriptreact,astro EmmetInstall]]
            )
        end,
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
        event = "UIEnter",
        config = function()
            require("indent_blankline").setup({
                show_current_context = true,
            })
        end
    },
    --comentarios
    {
        "numToStr/Comment.nvim",
        event = "BufEnter",
        config = function()
            require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
                mappings = {
                    extra = false,
                },
            })
        end,
    },
}
