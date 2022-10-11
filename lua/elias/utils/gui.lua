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
