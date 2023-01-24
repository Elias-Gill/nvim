require("elias/plugins")

------- archivos vimL -----
vim.cmd("source ~/.config/nvim/config/general_config.vim")
vim.cmd("source ~/.config/nvim/config/remaps.vim")
vim.cmd("source ~/.config/nvim/config/startify.vim")
-- vim.cmd('if exists("g:neovide") \nsource ~/.config/nvim/config/neovide.vim \n endif')
---------------------------

--buitin lsp
require("elias/lsp/mason")
require("elias/lsp/lsp_general")
require("elias/lsp/luasnips")
require("elias/lsp/debug")
require("elias/lsp/null_ls")

-- Utils
require("elias/utils/windline")
require("elias/utils/disable_builtins")
require("elias/utils/various-utils")
require("elias/utils/diffview")
require("elias/utils/lsp-visuals")

-- Navigation
require("elias/navigation/treesitter")
require("elias/navigation/todo")
require("elias/navigation/nvimtree")
require("elias/navigation/fzf")
require("elias/navigation/telescope")
