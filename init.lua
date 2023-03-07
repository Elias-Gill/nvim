------- archivos vimL -----
vim.cmd("source ~/.config/nvim/config/general_config.vim")
vim.cmd("source ~/.config/nvim/config/remaps.vim")
require("elias/lazy")
vim.cmd("source ~/.config/nvim/config/startify.vim")
---------------------------

--buitin lsp
require("elias/lsp/mason")
require("elias/lsp/lsp_general")
require("elias/lsp/luasnips")
require("elias/lsp/null_ls")

-- Utils
require("elias/utils/windline")
require("elias/utils/disable_builtins")
