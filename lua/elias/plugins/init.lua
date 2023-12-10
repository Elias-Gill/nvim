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
        "MeanderingProgrammer/harpoon-core.nvim",
        config = function()
            require('harpoon-core').setup({})
        end,
        event = "BufAdd"
    },
    "christoomey/vim-tmux-navigator",
    {
        "junegunn/fzf.vim",
        cmd = { "Files", "References", "Implementations", "History", "RG", "Helptags" },
        dependencies = {
            {
                "junegunn/fzf",
                build = "./install --all"
            },
            'gfanto/fzf-lsp.nvim'
        }
    },

    -- VISUALS --
    -- colorschemes
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                dim_inactive = {
                    enabled = false,
                },
                transparent_background = true,
                custom_highlights = function(_)
                    return {
                        ["NvimTreeCursorLine"] = { bg = "#323232", style = { "italic" } },
                        ["WinBarNC"] = { bg = "NONE" },
                        ["CursorLine"] = { bg = "#343434" },
                        ["@ibl.scope.char.1"] = { fg = "#eeeeee" }
                    }
                end
            })
            vim.cmd.colorscheme("catppuccin")
        end
    },

    -- Fonts and icons
    "nvim-tree/nvim-web-devicons",

    --     Utilities    --
    { "DreamMaoMao/yazi.nvim", cmd = "Yazi" },
    { "kevinhwang91/nvim-bqf", ft = "qf" },                                          -- better quickfixList
    { "tpope/vim-repeat",      event = "InsertEnter" },
    { "tpope/vim-surround",    event = { "InsertEnter", "BufEnter" } },              -- surround
    { "szw/vim-maximizer",     cmd = "MaximizerToggle" },                            -- maximizer
    { "josa42/nvim-gx",        keys = { { "gx", "<cmd>lua require('gx').gx()" } } }, -- open urls

    -- cleaning buffers
    {
        "kazhala/close-buffers.nvim",
        cmd = "BWipeout",
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
    -- "folke/zen-mode.nvim",

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
        event = "BufAdd",
        opts = {
            indent = { char = "┆" },
            scope = {
                show_start = false,
                show_end = false,
            },
            exclude = { filetypes = { "dashboard", "vim", "markdown", "txt" } }
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
    --emmet
    {
        "mattn/emmet-vim",
        ft = { "html", "css", "svelte", "javascript", "javascriptreact", "vue", "typescript", "typescriptreact", "astro" },
        config = function()
            vim.cmd(
                [[
                execute 'EmmetInstall'
                autocmd FileType svelte,html,css,javascript,javascriptreact,vue,typescript,typescriptreact,astro EmmetInstall]])
        end
    },
}
