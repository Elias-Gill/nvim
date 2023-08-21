-- general plugins without further customization
return {
    "nvim-lua/plenary.nvim",

    -- free copilot
    {
        "Exafunction/codeium.vim",
        cmd = "Codeium",
        config = function()
            vim.cmd('source $HOME/.config/nvim/config/codeium.vim')
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
    { "kevinhwang91/rnvimr", cmd = "RnvimrToggle" },

    -- colorschemes
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
    { "tpope/vim-surround",  event = { "InsertEnter", "BufEnter" } },
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
        event = "VeryLazy",
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

    -- Utilities
    { "kevinhwang91/nvim-bqf",     ft = "qf" }, -- better quickfixList
    { "mbbill/undotree",           cmd = "UndotreeToggle" },
    { "roblillack/vim-bufferlist", keys = { { "<leader>bl", "<cmd>call BufferList()<cr>" } } },
    { "szw/vim-maximizer",         cmd = "MaximizerToggle" },
    { "Asheq/close-buffers.vim",   cmd = "Bwipeout" },
    { "josa42/nvim-gx",            keys = { { "gx", "<cmd>lua require('gx').gx()" } } }, -- open urls
    {
        'NvChad/nvim-colorizer.lua',
        event = { "BufEnter", "BufAdd" },
        config = function()
            require('colorizer').setup()
        end
    },
}
