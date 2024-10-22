-- experimental
vim.loader.enable() -- lazy load everything
vim.g.editorconfig = true -- builtin editor config support
vim.cmd("packadd cfilter") -- filter quickfix results with CFilter

------- configuracion general -----
vim.g.mapleader = " "
require("elias/disable_builtins")
require("elias/options")
-- ./after/plugin/remaps.vim  <- remaps file
