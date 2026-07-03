local M = {}

local function setup_highlights()
    -- Función helper para cargar grupos
    local function load_syntax(groups)
        for group, settings in pairs(groups) do
            vim.api.nvim_set_hl(0, group, settings)
        end
    end

    -- Cargar y aplicar todos los grupos directamente
    load_syntax(require("plugins.oldworld.groups.editor"))
    load_syntax(require("plugins.oldworld.groups.syntax"))
    load_syntax(require("plugins.oldworld.groups.cmp"))
    load_syntax(require("plugins.oldworld.groups.bqf"))
    load_syntax(require("plugins.oldworld.groups.telescope"))
    load_syntax(require("plugins.oldworld.groups.indent_blankline"))
    load_syntax(require("plugins.oldworld.groups.lazy"))
    load_syntax(require("plugins.oldworld.groups.lsp"))
    load_syntax(require("plugins.oldworld.groups.markdown"))
    load_syntax(require("plugins.oldworld.groups.mason"))
    load_syntax(require("plugins.oldworld.groups.treesitter"))
end

function M.colorscheme()
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.o.background = "dark"
	vim.g.colors_name = "oldworld"
    vim.o.termguicolors = true
    setup_highlights()
end

return M

-- Si de por ahi quiero correr en terminal, pero para eso ya estan los colores como default
-- local function setup_terminal()
    -- 	vim.g.terminal_color_0 = p.black
    -- 	vim.g.terminal_color_1 = p.red
    -- 	vim.g.terminal_color_2 = p.green
    -- 	vim.g.terminal_color_3 = p.yellow
    -- 	vim.g.terminal_color_4 = p.blue
    -- 	vim.g.terminal_color_5 = p.purple
    -- 	vim.g.terminal_color_6 = p.cyan
    -- 	vim.g.terminal_color_7 = p.fg
    -- 	vim.g.terminal_color_8 = p.bright_black
    -- 	vim.g.terminal_color_9 = p.bright_red
    -- 	vim.g.terminal_color_10 = p.bright_green
    -- 	vim.g.terminal_color_11 = p.bright_yellow
    -- 	vim.g.terminal_color_12 = p.bright_blue
    -- 	vim.g.terminal_color_13 = p.bright_purple
    -- 	vim.g.terminal_color_14 = p.bright_cyan
    -- 	vim.g.terminal_color_15 = p.fg
    -- 	vim.g.terminal_color_background = p.bg
    -- 	vim.g.terminal_color_foreground = p.fg
    -- end
