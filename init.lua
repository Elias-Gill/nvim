vim.loader.enable()        -- lazy load everything
vim.g.editorconfig = true  -- builtin editor config support
vim.cmd("packadd cfilter") -- filter quickfix results with CFilter

------ configuracion general ------
vim.g.mapleader = " "
require("elias/disable_builtins")
require("elias/options")
require("elias/mappings")

-------------- LAZY ---------------
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

require("lazy").setup({
    ui = { border = "single" },
    change_detection = {
        enabled = false,
        notify = false,
    },
    spec = {
        { import = "elias.lazy.devtools" },
        { import = "elias.lazy.lsp" },
        { import = "elias.lazy.navigation" },
        { import = "elias.lazy.ui" },
        { import = "elias.lazy" },
    },
})

-- Super simple Kotlin language server (tree-sitter based navigation and definitions)

local lspconfig = require('lspconfig')
local configs   = require('lspconfig.configs')

if not configs.kmp_lsp then
    configs.kmp_lsp = {
        default_config = {
            cmd       = { 'kmp-lsp' },
            filetypes = { 'kotlin', 'java', 'swift' },
            root_dir  = lspconfig.util.root_pattern(
                'build.gradle', 'build.gradle.kts', 'pom.xml', 'settings.gradle', 'Package.swift', '.git'
            ),
            settings  = {},
        },
    }
end

lspconfig.kmp_lsp.setup {}
