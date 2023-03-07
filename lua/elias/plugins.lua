-- ------------- BOOTSTRAP-----------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ------------- PLUGINS ------------
require("lazy").setup({
    "goolord/nvim-colorscheme-convert",
    -- editor config like other editors
    { "gpanders/editorconfig.nvim", event = "BufAdd" },

    -- Custom libraries for neovim
    "nvim-lua/plenary.nvim",
    { "ThePrimeagen/harpoon",       event = "BufAdd" },
    { "Asheq/close-buffers.vim",    cmd = "Bwipeout" },
    "romainl/vim-cool",
    "christoomey/vim-tmux-navigator",
    -- use 'ThePrimeagen/refactoring.nvim'

    --  Start page
    { "dstein64/vim-startuptime", cmd = "StartupTime" },
    "mhinz/vim-startify",

    -- " Git inegration
    "tpope/vim-fugitive",
    { "almo7aya/openingh.nvim",   tag = "v1.0.1",     cmd = { "OpenInGHFile", "OpenInGHRepo" } },
    {
        "sindrets/diffview.nvim",
        cmd = "DiffviewOpen",
        config = function()
            require("elias/utils/diffview")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signcolumn = false,
            })
        end,
    },

    -- Functions tree
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        -- keys = "<leader>vf",
        config = function()
            require("elias.utils.symbols_tree")
        end,
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

    -- signature help
    { "ray-x/lsp_signature.nvim", config = function()
        require("elias.lsp.signature")
    end },
    -- free copilot
    { "Exafunction/codeium.vim",
        cmd = "Codeium",
        config = function()
            vim.cmd('source /home/elias/.config/nvim/config/codeium.vim')
        end },
    -- Neovim Cmp (completition engine) and snippets
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind.nvim",
            "saadparwaiz1/cmp_luasnip",
            -- {'tzachar/cmp-tabnine', build = './install.sh'}
        },
        config = function()
            require("elias/lsp/nvim_cmp")
        end,
    },

    -- Tree sitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },
    {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
        config = function()
            require("nvim-treesitter.configs").setup({})
        end,
    },

    -- Lsp configs
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "glepnir/lspsaga.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    -- use 'folke/trouble.nvim'

    -- Tabline and status bar
    "windwp/windline.nvim",
    "alvarosevilla95/luatab.nvim",

    -- File search and tree
    "ibhagwan/fzf-lua",
    "kyazdani42/nvim-tree.lua",
    { "kevinhwang91/rnvimr",  cmd = "RnvimrToggle" },
    {
        "antosha417/nvim-lsp-file-operations",
        event = "InsertLeave",
        config = function()
            require("lsp-file-operations").setup()
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = {
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
    },

    -- Fonts and icons
    "ryanoasis/vim-devicons",
    "nvim-tree/nvim-web-devicons",

    -- Themes, GUI and customization
    "stevearc/dressing.nvim", -- better custom gui
    "folke/tokyonight.nvim",
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.cmd("set termguicolors")
            vim.notify = require("notify")
            require("notify").setup({
                background_colour = "#000000",
                timeout = 500,
                render = "compact",
            })
        end,
    },

    -- Pareado (){}""'', comentarios y ayudas de indentacion
    "windwp/nvim-autopairs",
    "tpope/vim-surround",
    "lukas-reineke/indent-blankline.nvim",
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
    { "kevinhwang91/nvim-bqf" }, -- quickfixList
    {
        "folke/todo-comments.nvim",
        event = "BufAdd",
        config = function()
            require("elias/navigation/todo")
        end,
    },
    "jessarcher/vim-heritage", -- make parent directories
    { "mbbill/undotree",   cmd = "UndotreeToggle" },
    { "szw/vim-maximizer", cmd = "MaximizerToggle" },
    -- wiki
    {
        "jakewvincent/mkdnflow.nvim",
        ft = { "markdown" },
        dependencies = {
            { "ellisonleao/glow.nvim",
                branch = "main",
                config = function()
                    require("glow").setup({})
                end,
            },
            'prurigro/vim-markdown-concealed'
        },
        config = function()
            require("elias/utils/wiki")
        end,
    },

    -- colorpicker and colorizer
    "uga-rosa/ccc.nvim",
    -- open urls in browser
    { "dhruvasagar/vim-open-url", cmd = "OpenURLFind" },

    -- debuggers
    {
        "mfussenegger/nvim-dap",
        cmd = "DapContinue",
        config = function()
            require("elias/lsp/debug")
        end,
        dependencies = {
            "rcarriga/nvim-dap-ui",
            -- golang
            {
                "leoluz/nvim-dap-go",
                ft = { "golang", "go" },
                config = function()
                    require("dap-go").setup()
                end,
            },
            -- python
            {
                "mfussenegger/nvim-dap-python",
                ft = { "python", "py" },
                config = function()
                    require("dap-python").setup("/home/elias/.virtualenvs/debugpy/bin/python")
                end,
            },
        },
    },
}, {
    ui = {
        border = "single",
    },
})
