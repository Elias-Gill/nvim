require('luatab').setup {
    separator = function() return '' end,
    modified = function(bufnr) return vim.fn.getbufvar(bufnr, '&modified') == 1 and '+ ' or '' end,
    windowCount = function(index)
        return ''
    end
}
