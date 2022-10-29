require('dressing').setup({
    select = {
        backend = { "telescope", "fzf_lua","fzf", "builtin", "nui" },
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
