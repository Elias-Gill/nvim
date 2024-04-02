-- experimental
vim.loader.enable() -- lazy load everything
vim.g.editorconfig = true -- builtin editor config support

------- configuracion general -----
vim.g.mapleader = " "
require("elias/disable_builtins")
require("elias/options")
-- ./after/plugin/remaps.vim  <- remaps file

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

require("lazy").setup({
	ui = { border = "single" },
	change_detection = {
		enabled = false,
		notify = false,
	},
	spec = {
		{ import = "elias.plugins.devtools" },
		{ import = "elias.plugins.lsp" },
		{ import = "elias.plugins.navigation" },
		{ import = "elias.plugins.ui" },
		{ import = "elias.plugins" },
	},
})
