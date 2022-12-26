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
-- modo zen para nvim
--[[ require("zen-mode").setup {
    window = {
        width = 120
    }
} ]]

-- tabline personalizada con iconos
require('luatab').setup {
    separator = function() return '' end,
    modified = function(bufnr) return vim.fn.getbufvar(bufnr, '&modified') == 1 and '+ ' or '' end,
    windowCount = function(index)
        return ''
    end
}

require("indent_blankline").setup {
    show_current_context = true,
    -- show_current_context_start = true,
}

require('nvim-autopairs').setup({
    enable_check_bracket_line = false
})
