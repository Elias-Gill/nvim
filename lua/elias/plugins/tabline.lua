return {
    -- tabline
    "alvarosevilla95/luatab.nvim",
    event = "TabNew",
    config = function()
        -- tabline personalizada con iconos
        require("luatab").setup({
            separator = function()
                return ""
            end,
            modified = function(bufnr)
                return vim.fn.getbufvar(bufnr, "&modified") == 1 and "+ " or ""
            end,
            windowCount = function()
                return ""
            end,
        })
    end,
}
