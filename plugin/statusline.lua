vim.cmd([[
hi! StatusLineNormal  guibg=#5f8f7f
hi! StatusLineInsert  guibg=#bdae6f
hi! StatusLineVisual  guibg=#7c6f8f
hi! StatusLineCommand guibg=#d46e6e
hi! StatusLineReplace guibg=#a96f7f
hi! StatusLineSelect  guibg=#8f8f6f
]])

local mode_color = {
	n = "%#StatusLineNormal#",
	i = "%#StatusLineInsert#",
	v = "%#StatusLineVisual#",
	V = "%#StatusLineVisual#",
	[""] = "%#StatusLineVisual#",
	c = "%#StatusLineCommand#",
	no = "%#StatusLineNormal#",
	s = "%#StatusLineSelect#",
	S = "%#StatusLineSelect#",
	R = "%#StatusLineReplace#",
}

local function get_mode_icon()
	local mode = vim.fn.mode()
	local color = mode_color[mode] or "%#StatusLineNormal#"
	return color .. " %*"
end

local function lsp_diagnostics()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if vim.tbl_isempty(clients) then
		return ""
	end

	local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local warns = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local infos = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

	return table.concat({
		" ",
		"%#DiagnosticError# " .. errors,
		" ",
		"%#DiagnosticWarn# " .. warns,
		" ",
		"%#DiagnosticInfo# " .. infos,
		" ",
		"%#DiagnosticHint# " .. hints,
		"%*",
	})
end

local function lsp_servers()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if vim.tbl_isempty(clients) then
		return "%#DiagnosticWarn# :%* nil"
	end
	local names = {}
	for _, c in ipairs(clients) do
		table.insert(names, c.name)
	end
	return "%#DiagnosticWarn# :%* " .. table.concat(names, ", ")
end

local function relative_path()
	local full = vim.api.nvim_buf_get_name(0)
	if full == "" then
		return "[No Name]"
	end
	local rel = vim.fn.fnamemodify(full, ":.")
	return rel
end

-- Set the statusline
vim.o.statusline = table.concat({
	"%{%v:lua._G.statusline_icon()%}", -- left
	" ",
	"%{%v:lua._G.statusline_lsp()%} %{%v:lua._G.statusline_diagnostics()%}", -- lsp
	"%= ", -- separator
	"%{%v:lua._G.relative_path()%} %m %r", -- file stats
	"%= ", -- separator
	"%l/%L [%p%%]", -- file info
	" ",
	"%{%v:lua._G.statusline_icon()%}", -- right
})

-- Expose functions to global scope for statusline evaluation
_G.statusline_icon = get_mode_icon
_G.statusline_lsp = lsp_servers
_G.statusline_diagnostics = lsp_diagnostics
_G.relative_path = relative_path
