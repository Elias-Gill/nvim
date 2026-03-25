-- FILE: lua/fex/init.lua
local api = vim.api
local paths = require("fex.paths")
local render = require("fex.render")

local M = {}

local function ensure_ns()
	return api.nvim_create_namespace("fex")
end

local function ctx_from(buf, win)
	return {
		buf = buf,
		win = win,
		ns = ensure_ns(),
	}
end

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
		m.fullPath = normalize_path(m.name)
	else
		m.fullPath = normalize_path(paths.add(root.name, paths.name(m.name)))
	end

	m._line = ln
	return m
end

local function show(ctx, path, selectName)
	render.render(ctx, path, selectName)
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

	bm("<CR>", ".enter()", "Enter (abrir archivo o entrar en carpeta)")
	bm("-", ".up()", "Subir al directorio padre")
	bm("a", ".create()", "Crear archivo/carpeta")
	bm("d", ".delete()", "Eliminar")
	bm("r", ".rename()", "Renombrar")
	bm("y", ".yank()", "Copiar ruta al portapapeles")
	bm("i", ".information()", "Información del archivo")
	bm("q", ".close()", "Cerrar explorador")
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
		-- Reemplaza el buffer directamente
		vim.cmd("edit " .. vim.fn.fnameescape(curr.fullPath))
	end
end

function M.up()
	local ctx = ctx_from(api.nvim_get_current_buf(), api.nvim_get_current_win())
	local curr = current_meta(ctx)
	if not curr or not curr.root then
		return
	end
	local parent = paths.directory(curr.root.name)
	show(ctx, parent, paths.name(curr.root.name))
end

function M.create()
	local ctx = ctx_from(api.nvim_get_current_buf(), api.nvim_get_current_win())
	local curr = current_meta(ctx)
	if not curr or not curr.root then
		return
	end
	local root = curr.root

	local name = vim.fn.input("Create (append / for dir): ")
	if name == "" then
		return
	end

	local is_dir = name:sub(-1) == "/"
	local target = paths.add(root.name, name)

	local select_name = name:find("/") and name:match("^([^/]+)") or name

	if is_dir then
		local dir_to_create = target:gsub("/$", "")
		vim.fn.mkdir(dir_to_create, "p")
	else
		local parent_dir = paths.directory(target)
		vim.fn.mkdir(parent_dir, "p")

		local fd = io.open(target, "w")
		if fd then
			fd:close()
		end
	end

	show(ctx, root.name, select_name)
end

function M.delete()
	local ctx = ctx_from(api.nvim_get_current_buf(), api.nvim_get_current_win())
	local curr = current_meta(ctx)
	if not curr then
		return
	end

	local flags = curr.isDir and "d" or ""
	local c = vim.fn.confirm("Delete " .. curr.fullPath .. "?", "&Yes\n&No")
	if c == 1 then
		vim.fn.delete(curr.fullPath, flags)
		show(ctx, curr.root.name)
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
	show(ctx, curr.root.name)
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

function M.open(path)
	local input = path or paths.currentFile()
	local full = paths.full(input)
	if vim.fn.getftype(full) == "" then
		full = vim.fn.getcwd() .. "/"
	end

	local directory = full
	local filename = nil
	if paths.name(full) ~= "" then
		filename = paths.name(full)
		directory = paths.directory(full)
	end

	-- Creamos el buffer del explorador
	vim.cmd("enew")
	local buf = api.nvim_get_current_buf()

	-- Configuración clave para que sea reemplazable y no moleste
	api.nvim_buf_set_option(buf, "buftype", "")           -- buffer normal (permite :edit)
	api.nvim_buf_set_option(buf, "bufhidden", "wipe")     -- se borra al reemplazar
	api.nvim_buf_set_option(buf, "buflisted", false)      -- no aparece en :ls
	api.nvim_buf_set_option(buf, "swapfile", false)
	api.nvim_buf_set_option(buf, "undofile", false)
	api.nvim_buf_set_option(buf, "filetype", "fex")

	-- ← ESTO es lo nuevo que soluciona el prompt de "guardar"
	api.nvim_buf_set_option(buf, "modifiable", true)
	-- Forzamos que no esté marcado como modificado
	api.nvim_buf_set_option(buf, "modified", false)

	local win = api.nvim_get_current_win()
	local ctx = ctx_from(buf, win)

	set_keymaps(ctx)
	show(ctx, directory, filename)

	-- Extra seguridad: después del render también forzamos modified = false
	api.nvim_buf_set_option(buf, "modified", false)
end

return M
