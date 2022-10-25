require('elias/packer_config')
require('mason').setup()
require('elias/plugins')

------- archivos vimL -----
vim.cmd('source ~/.config/nvim/config/general_config.vim')
vim.cmd('source ~/.config/nvim/config/remaps.vim')
vim.cmd('source ~/.config/nvim/config/startify.vim')
vim.cmd('if exists("g:neovide") \nsource ~/.config/nvim/config/neovide.vim \n endif')
---------------------------

-- require 'elias/plugins'
require('impatient')

-- buitin lsp
require('elias/lsp/lsp_general')
require('elias/lsp/nvim_cmp')
require('elias/lsp/trouble')
require('elias/lsp/luasnips')
require('elias/lsp/debug')

-- Utils
require('elias/utils/windline')
require('elias/utils/tabline')
require('elias/utils/disable_builtins')
require('elias/utils/various-utils')
require('elias/utils/gitsigns')
require('elias/utils/gui')
require('elias/utils/wiki')
-- require('elias/utils/sniprun')
-- require('elias/unnused/lualine')

-- Navigation
require('elias/navigation/treesitter')
require('elias/navigation/todo')
require('elias/navigation/fzf')
require('elias/navigation/telescope')
require('elias/navigation/nvimtree')
