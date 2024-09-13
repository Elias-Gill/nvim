local M = {}

function M.colorscheme()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end
    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.g.colors_name = "oldworld"
    require("oldworld.highlights").setup()

    -- descomentar si es que necesito usar solo termcolors
    --require("oldworld.terminal").setup()
end

return M
