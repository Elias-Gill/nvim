-- experimental
vim.loader.enable() -- lazy load everything
vim.g.editorconfig = true -- builtin editor config support
vim.cmd("packadd cfilter") -- filter quickfix results with CFilter

------- configuracion general -----
vim.g.mapleader = " "
-- ./after/plugin/remaps.vim  <- remaps file
-- ./plugin/options.lua  <- options
-- ./plugin/disable_builtins.lua  <- disabling unnused builtins
