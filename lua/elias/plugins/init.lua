-- general plugins without further customization
return {
    "nvim-lua/plenary.nvim",
    -- editor config like other editors
    { "gpanders/editorconfig.nvim", event = "BufAdd" },

    -- free copilot
    {
        "Exafunction/codeium.vim",
        cmd = "Codeium",
        config = function()
            vim.cmd('source /home/elias/.config/nvim/config/codeium.vim')
        end
    },

    --  Start page
    { "dstein64/vim-startuptime",   cmd = "StartupTime" },
    -- { "mhinz/vim-startify",         config = function() vim.cmd("source ~/.config/nvim/config/startify.vim") end },

    -- coconut oil navigation
    { "ThePrimeagen/harpoon",       event = "BufAdd" },
    "christoomey/vim-tmux-navigator",
    -- use 'ThePrimeagen/refactoring.nvim'
    -- { 'ThePrimeagen/git-worktree.nvim', config = function()
    --     require("git-worktree").setup({})
    -- end },

    -- File explorers
    { "kevinhwang91/rnvimr",     cmd = "RnvimrToggle" },

    -- colorschemes
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                transparent_background = true,
                custom_highlights = function(colors)
                    return {
                        ["NvimTreeCursorLine"] = { bg = "#323232", style = { "italic" } },
                    }
                end
            })
            vim.cmd.colorscheme "catppuccin"
        end
    },

    -- Fonts and icons
    "ryanoasis/vim-devicons",
    "nvim-tree/nvim-web-devicons",
    {
        -- better custom gui
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({
                select = {
                    backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
                },
            })
        end
    },

    -- "Super-completado html
    {
        "mattn/emmet-vim",
        ft = { "html", "css", "svelte", "javascript", "javascriptreact", "vue", "typescript", "typescriptreact" },
        config = function()
            vim.api.nvim_command(
                [[autocmd FileType svelte,html,css,javascript,javascriptreact,vue,typescript,typescriptreact EmmetInstall]]
            )
        end,
    },
    -- Pareado (){}""''
    "tpope/vim-surround",
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                enable_check_bracket_line = false,
            })
        end,
    },
    --ayudas de indentacion
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                show_current_context = true,
            })
        end
    },
    --comentarios
    {
        "numToStr/Comment.nvim",
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
    { "kevinhwang91/nvim-bqf",   ft = "qf" }, -- better quickfixList
    { "mbbill/undotree",         cmd = "UndotreeToggle" },
    { "szw/vim-maximizer",       cmd = "MaximizerToggle" },
    { "Asheq/close-buffers.vim", cmd = "Bwipeout" },
    { "josa42/nvim-gx",          keys = { "gx", "<cmd>lua require('gx').gx()" } }, -- open urls
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup()
        end
    }
    -- "uga-rosa/ccc.nvim",
}
