vim.loader.enable() -- lazy load everything
vim.g.editorconfig = true -- builtin editor config support
------- configuracion general -----
require("elias/disable_builtins")
vim.cmd("source ~/.config/nvim/config/remaps.vim")
vim.cmd("source ~/.config/nvim/config/general_config.vim")

--------------- LAZY -----------
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
require("lazy").setup('elias/plugins', { ui = { border = "single"}})
