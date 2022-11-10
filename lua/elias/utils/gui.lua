require('dressing').setup({
    select = {
        backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
    }
})

-- colorizer and colorpicker
local ccc = require("ccc")
ccc.setup({
    highlighter = {
        auto_enable = true
    }
})
-- require 'colorizer'.setup()

require('luatab').setup {
    separator = function() return '' end,
    modified = function(bufnr) return vim.fn.getbufvar(bufnr, '&modified') == 1 and '+ ' or '' end,
    windowCount = function(index)
        return ''
    end
}

-- modo zen para nvim
require("zen-mode").setup {
    window = {
        width = 120
    }
}

-- gruvbox config
vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_keyword_style = "italic"
vim.g.gruvbox_baby_telescope_theme = 1
vim.g.gruvbox_baby_transparent_mode = 1
