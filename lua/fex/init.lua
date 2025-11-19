local api = vim.api
local paths = require("fex.paths")
local render = require("fex.render")

local M = {}

local explorer_width = 30

local function ensure_ns()
	return api.nvim_create_namespace("fex")
end

local function create_buf(opts)
	local buf = api.nvim_create_buf(false, true)
	api.nvim_buf_set_option(buf, "buftype", "nowrite")
	api.nvim_buf_set_option(buf, "bufhidden", "delete")
	api.nvim_buf_set_option(buf, "filetype", "fex")
	api.nvim_buf_set_var(buf, "options", opts or {})
	return buf
end

local function ctx_from(buf, win)
	return {
		buf = buf,
		win = win,
		ns = ensure_ns(),
		options = api.nvim_buf_get_var(buf, "options") or {},
	}
end

-- Asegura que path sea absoluto (con / al inicio)
local function normalize_path(p)
	if p == nil or p == "" then
		return vim.loop.cwd() .. "/"
	end
	if vim.startswith(p, "/") then
		return p
	end
	return "/" .. p
end

local function current_meta(ctx)
	local ln = api.nvim_win_get_cursor(ctx.win)[1]
	local lines = api.nvim_buf_get_var(ctx.buf, "lines") or {}
	local m = lines[ln]
	if not m then
		return nil
	end

	local root
	for _, L in ipairs(lines) do
		if L.isRoot then
			root = L
			break
		end
	end
	m.root = root

	if m.isRoot then
		-- ya debería ser absoluto
		m.fullPath = normalize_path(m.name)
	else
		-- Se asegura ruta absoluta concatenando root + nombre
		m.fullPath = normalize_path(paths.add(root.name, paths.name(m.name)))
	end

	m._line = ln
	return m
end

local function enforce_left(win)
	local cur = api.nvim_get_current_win()
	vim.api.nvim_set_current_win(win)
	vim.cmd("wincmd H")
	vim.api.nvim_set_current_win(cur)
end

local function show(ctx, path, selectName, force_full_render)
	local simple = ctx.options.simple
	if force_full_render then
		simple = false
	end

	local lines
	if simple then
		lines = render_simple.render(ctx, path, selectName)
	else
		lines = render.render(ctx, path, selectName)
	end
	vim.api.nvim_buf_set_var(ctx.buf, "lines", lines)

	if ctx.options.explorer_mode then
		enforce_left(ctx.win)
		vim.api.nvim_win_set_option(ctx.win, "winfixwidth", true)
		vim.api.nvim_win_set_width(ctx.win, explorer_width)
	end
end

local function set_keymaps(ctx)
	local buf = ctx.buf
	local function bm(lhs, rhs, desc)
		api.nvim_buf_set_keymap(
			buf,
			"n",
			lhs,
			'<cmd>lua require("fex")' .. rhs .. "<CR>",
			{ noremap = true, silent = true, desc = desc }
		)
	end

	bm("<CR>", ".enter()", "enter")
	bm("-", ".up()", "up")
	bm("a", ".create()", "create")
	bm("v", ".open_vsplit_right()", "vsplit right (keep explorer)")
	bm("s", ".open_split_below()", "split below (keep explorer)")
	bm("o", ".open_over()", "open over current buffer")
	bm("d", ".delete()", "delete")
	bm("r", ".rename()", "rename")
	bm("y", ".yank()", "yank path")
	bm("i", ".information()", "information")
	bm("q", ".close()", "quit")
end

function M.open_over()
	local ctx = ctx_from(api.nvim_get_current_buf(), api.nvim_get_current_win())
	local curr = current_meta(ctx)
	if not curr then
		return
	end

	if curr.isDir then
		show(ctx, curr.fullPath)
	else
		vim.cmd("edit " .. vim.fn.fnameescape(curr.fullPath))
	end
end

function M.open_vsplit_right()
	local ctx = ctx_from(api.nvim_get_current_buf(), api.nvim_get_current_win())
	local curr = current_meta(ctx)
	if not curr then
		return
	end

	if curr.isDir then
		show(ctx, curr.fullPath)
		return
	end

	pcall(vim.cmd, "wincmd H")
	vim.cmd("rightbelow vsplit " .. vim.fn.fnameescape(curr.fullPath))
	vim.api.nvim_win_set_option(ctx.win, "winfixwidth", true)
	vim.api.nvim_win_set_width(ctx.win, explorer_width)
	pcall(api.nvim_set_current_win, ctx.win)
end

function M.open_split_below()
	local ctx = ctx_from(api.nvim_get_current_buf(), api.nvim_get_current_win())
	local curr = current_meta(ctx)
	if not curr then
		return
	end

	if curr.isDir then
		show(ctx, curr.fullPath)
		return
	end

	vim.cmd("rightbelow split " .. vim.fn.fnameescape(curr.fullPath))
	vim.api.nvim_win_set_option(ctx.win, "winfixwidth", true)
	vim.api.nvim_win_set_width(ctx.win, explorer_width)
	pcall(api.nvim_set_current_win, ctx.win)
end

local function get_right_win(left_win)
	local wins = vim.api.nvim_tabpage_list_wins(0)
	local left_win_pos = vim.api.nvim_win_get_position(left_win)
	local left_win_col = left_win_pos[2]
	local left_win_row = left_win_pos[1]

	for _, w in ipairs(wins) do
		if w ~= left_win then
			local pos = vim.api.nvim_win_get_position(w)
			local col = pos[2]
			local row = pos[1]
			if col > left_win_col and row == left_win_row then
				return w
			end
		end
	end
	return nil
end

function M.open_split_explorer(path)
	path = path or vim.loop.cwd()
	local buf = create_buf({ simple = false, explorer_mode = true }) -- simple false para highlight

	vim.cmd("topleft vsplit")
	local win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_buf(win, buf)
	vim.api.nvim_win_set_width(win, explorer_width)
	vim.api.nvim_win_set_option(win, "winfixwidth", true)

	local ctx = ctx_from(buf, win)
	show(ctx, path)

	-- Keymap para Enter: abrir archivos en ventana a la derecha fija
	vim.keymap.set("n", "<CR>", function()
		local curr = current_meta(ctx)
		if not curr then
			return
		end

		if curr.isDir then
			show(ctx, curr.fullPath)
		else
			local right_win = get_right_win(win)
			if not right_win then
				vim.api.nvim_set_current_win(win)
				vim.cmd("rightbelow vsplit")
				right_win = vim.api.nvim_get_current_win()
			end
			vim.api.nvim_win_set_buf(right_win, vim.api.nvim_create_buf(false, true))
			vim.api.nvim_set_current_win(right_win)
			vim.cmd("edit " .. vim.fn.fnameescape(curr.fullPath))
			vim.api.nvim_set_current_win(win)
		end
	end, { buffer = buf })

	return buf, win
end

function M.enter()
	local ctx = ctx_from(api.nvim_get_current_buf(), api.nvim_get_current_win())
	local curr = current_meta(ctx)
	if not curr then
		return
	end

	if curr.isDir then
		show(ctx, curr.fullPath)
	else
		if ctx.options.explorer_mode then
			local right_win = get_right_win(ctx.win)
			if not right_win then
				vim.api.nvim_set_current_win(ctx.win)
				vim.cmd("rightbelow vsplit")
				right_win = vim.api.nvim_get_current_win()
			end
			vim.api.nvim_set_current_win(right_win)
			vim.cmd("edit " .. vim.fn.fnameescape(curr.fullPath))
			vim.api.nvim_set_current_win(ctx.win)
		else
			vim.cmd("edit " .. vim.fn.fnameescape(curr.fullPath))
		end
	end
end

function M.up()
	local ctx = ctx_from(api.nvim_get_current_buf(), api.nvim_get_current_win())
	local root = ctx.options.lines and ctx.options.lines[1] or current_meta(ctx).root
	if not root then
		return
	end

	local parent = paths.directory(root.name)
	show(ctx, parent, paths.name(root.name))
end

function M.create()
	local ctx = ctx_from(api.nvim_get_current_buf(), api.nvim_get_current_win())
	local root = current_meta(ctx) and current_meta(ctx).root
	if not root then
		return
	end
	local name = vim.fn.input("Create (append / for dir): ")
	if name == "" then
		return
	end
	local target = paths.add(root.name, name)
	if name:sub(-1) == "/" then
		vim.fn.mkdir(target)
		show(ctx, root.name, name:sub(1, -2))
	else
		local fd = io.open(target, "w")
		if fd then
			fd:close()
		end
		show(ctx, root.name, name)
	end
end

function M.delete()
	local ctx = ctx_from(api.nvim_get_current_buf(), api.nvim_get_current_win())
	local curr = current_meta(ctx)
	if not curr then
		return
	end
	local flags = curr.isDir and "d" or ""
	local c = vim.fn.confirm("Delete " .. curr.fullPath, "&Yes\n&No")
	if c == 1 then
		vim.fn.delete(curr.fullPath, flags)
		show(ctx, curr.root and curr.root.name or vim.fn.getcwd())
	end
end

function M.rename()
	local ctx = ctx_from(api.nvim_get_current_buf(), api.nvim_get_current_win())
	local curr = current_meta(ctx)
	if not curr then
		return
	end
	local to = vim.fn.input("Rename to: ", curr.fullPath)
	if to == "" then
		return
	end
	vim.fn.rename(curr.fullPath, to)
	show(ctx, curr.root and curr.root.name or vim.fn.getcwd())
end

function M.yank()
	local ctx = ctx_from(api.nvim_get_current_buf(), api.nvim_get_current_win())
	local curr = current_meta(ctx)
	if not curr then
		return
	end
	vim.fn.setreg("+", curr.fullPath)
	print(curr.fullPath)
end

function M.information()
	local ctx = ctx_from(api.nvim_get_current_buf(), api.nvim_get_current_win())
	local curr = current_meta(ctx)
	if not curr then
		return
	end
	local out = {}
	for line in io.popen("file " .. vim.fn.shellescape(curr.fullPath)):lines() do
		table.insert(out, line)
	end
	local b = api.nvim_create_buf(false, true)
	api.nvim_buf_set_lines(b, 0, -1, false, out)
	api.nvim_buf_set_option(b, "modifiable", false)
	api.nvim_buf_set_option(b, "buftype", "nofile")
	api.nvim_buf_set_option(b, "bufhidden", "wipe")
	api.nvim_buf_set_keymap(b, "n", "q", "<cmd>bwipeout!<cr>", { silent = true, noremap = true })
	local opts = {
		relative = "cursor",
		row = 1,
		col = 0,
		width = 60,
		height = math.min(10, #out),
		border = "single",
		noautocmd = true,
	}
	api.nvim_open_win(b, true, opts)
end

function M.close()
	pcall(vim.cmd, "bwipeout!")
end

function M.open(path, opts)
	opts = opts or {}
	local input = path or paths.currentFile()
	local full = paths.full(input)
	if vim.fn.getftype(full) == "" then
		full = vim.fn.getcwd() .. "/"
	end
	local directory = full
	local filename
	if paths.name(full) ~= "" then
		filename = paths.name(full)
		directory = paths.directory(full)
	end

	-- Abrir en pantalla completa (nueva ventana), modo dired (full screen)
	vim.cmd("enew") -- nueva ventana sin archivo
	local buf = api.nvim_get_current_buf()
	api.nvim_buf_set_option(buf, "buftype", "nofile")
	api.nvim_buf_set_option(buf, "bufhidden", "hide")
	api.nvim_buf_set_option(buf, "filetype", "fex")
	api.nvim_buf_set_var(buf, "options", opts)
	local win = api.nvim_get_current_win()
	local ctx = ctx_from(buf, win)
	set_keymaps(ctx)
	-- Forzar render completo con permisos
	show(ctx, directory, filename, true)
end

return M
