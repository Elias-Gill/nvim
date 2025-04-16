local M = {}

local function setup_highlights()
    -- Función helper para cargar grupos
    local function load_syntax(groups)
        for group, settings in pairs(groups) do
            vim.api.nvim_set_hl(0, group, settings)
        end
    end

    -- Cargar y aplicar todos los grupos directamente
    load_syntax(require("oldworld.groups.editor"))
    load_syntax(require("oldworld.groups.syntax"))
    load_syntax(require("oldworld.groups.cmp"))
    load_syntax(require("oldworld.groups.bqf"))
    load_syntax(require("oldworld.groups.telescope"))
    load_syntax(require("oldworld.groups.indent_blankline"))
    load_syntax(require("oldworld.groups.lazy"))
    load_syntax(require("oldworld.groups.lsp"))
    load_syntax(require("oldworld.groups.markdown"))
    load_syntax(require("oldworld.groups.mason"))
    load_syntax(require("oldworld.groups.treesitter"))
end

local function setup_terminal()
	vim.g.terminal_color_0 = p.black
	vim.g.terminal_color_1 = p.red
	vim.g.terminal_color_2 = p.green
	vim.g.terminal_color_3 = p.yellow
	vim.g.terminal_color_4 = p.blue
	vim.g.terminal_color_5 = p.purple
	vim.g.terminal_color_6 = p.cyan
	vim.g.terminal_color_7 = p.fg
	vim.g.terminal_color_8 = p.bright_black
	vim.g.terminal_color_9 = p.bright_red
	vim.g.terminal_color_10 = p.bright_green
	vim.g.terminal_color_11 = p.bright_yellow
	vim.g.terminal_color_12 = p.bright_blue
	vim.g.terminal_color_13 = p.bright_purple
	vim.g.terminal_color_14 = p.bright_cyan
	vim.g.terminal_color_15 = p.fg
	vim.g.terminal_color_background = p.bg
	vim.g.terminal_color_foreground = p.fg
end

function M.colorscheme()
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.o.background = "dark"
	vim.g.colors_name = "oldworld"

	local function is_limited_terminal()
		-- 1. Detección para Windows
		if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
			-- Windows Terminal/ConHost soporta 24-bit, CMD tradicional solo 16 colores
			return os.getenv("WT_SESSION") == nil and os.getenv("ANSICON") == nil
		end

		-- 2. Detección para Unix/Linux/macOS
		if vim.fn.has("gui_running") == 1 then
			return false
		end

		-- 3. Verificación portable de colores del terminal
		local colors
		if vim.fn.executable("tput") == 1 then
			colors = tonumber(vim.fn.system("tput colors 2>/dev/null")) or 8
		else
			-- Valor por defecto para terminales sin tput
			colors = os.getenv("COLORTERM") == "truecolor" and 256 or 8
		end

		return colors <= 16
	end

	-- Configuración basada en la detección
	if is_limited_terminal() then
		vim.o.termguicolors = false
		setup_terminal()
		vim.notify("[oldworld] Usando modo compatible (16 colores)", vim.log.levels.INFO)
	else
		vim.o.termguicolors = true
		setup_highlights()
	end
end

return M
