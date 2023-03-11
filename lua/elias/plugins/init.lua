-- general plugins without further customization
return {
    -- editor config like other editors
    "nvim-lua/plenary.nvim",
    { "gpanders/editorconfig.nvim", event = "BufAdd" },

    -- coconut oil navigation
    { "ThePrimeagen/harpoon",       event = "BufAdd" },
    "christoomey/vim-tmux-navigator",
    -- use 'ThePrimeagen/refactoring.nvim'

    --  Start page
    { "dstein64/vim-startuptime", cmd = "StartupTime" },
    "mhinz/vim-startify",

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

    -- free copilot
    { "Exafunction/codeium.vim",
        cmd = "Codeium",
        config = function()
            vim.cmd('source /home/elias/.config/nvim/config/codeium.vim')
        end },

    -- Tabline and status bar
    "windwp/windline.nvim",
    {
        "alvarosevilla95/luatab.nvim",
        config = function()
            -- tabline personalizada con iconos
            require("luatab").setup({
                separator = function()
                    return ""
                end,
                modified = function(bufnr)
                    return vim.fn.getbufvar(bufnr, "&modified") == 1 and "+ " or ""
                end,
                windowCount = function()
                    return ""
                end,
            })
        end
    },

    -- File tree
    { "kevinhwang91/rnvimr",      cmd = "RnvimrToggle" },
    {
        "antosha417/nvim-lsp-file-operations",
        event = "InsertLeave",
        config = function()
            require("lsp-file-operations").setup()
        end,
    },

    -- Fonts and icons
    "ryanoasis/vim-devicons",
    "nvim-tree/nvim-web-devicons",
    { -- better custom gui
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({
                select = {
                    backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
                },
            })
        end
    },

    -- colorschemes
    { "NTBBloodbath/sweetie.nvim",
        config = function()
            require("sweetie").setup({
                palette = {
                    dark = {bg = "none"},
                },
            })
        end
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
    { "lukas-reineke/indent-blankline.nvim", config = function()
        require("indent_blankline").setup({
            show_current_context = true,
            -- show_current_context_start = true,
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
    "jessarcher/vim-heritage", -- make parent directories
    "romainl/vim-cool", -- find highlighter
    { "kevinhwang91/nvim-bqf" }, -- better quickfixList
    { "mbbill/undotree",      cmd = "UndotreeToggle" },
    { "szw/vim-maximizer",    cmd = "MaximizerToggle" },
    { "Asheq/close-buffers.vim",    cmd = "Bwipeout" },
    { "dhruvasagar/vim-open-url", cmd = "OpenURLFind" }, -- open urls in browser
    { -- colorpicker and colorizer
        "uga-rosa/ccc.nvim",
        config = function()
            local ccc = require("ccc")
            ccc.setup({
                highlighter = {
                    auto_enable = true,
                },
            })
        end
    },
}
