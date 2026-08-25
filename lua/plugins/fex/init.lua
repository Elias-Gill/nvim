local api = vim.api
local fn = vim.fn
local uv = vim.uv

local M = {}
local ns = api.nvim_create_namespace("fex")

-- =========================
-- PATH HELPERS
-- =========================

local function full(p)
    return fn.fnamemodify(p, ":p")
end

local function name(p)
    return fn.fnamemodify(p, ":t")
end

local function directory(p)
    return fn.fnamemodify(p, ":h")
end

local function current_file()
    return fn.expand("%:p")
end

local function add_path(p, part)
    p = full(p)
    if p:sub(-1) ~= "/" then
        p = p .. "/"
    end
    return p .. part
end

local function normalize_path(p)
    if not p or p == "" then
        return uv.cwd() .. "/"
    end
    return vim.startswith(p, "/") and p or "/" .. p
end

-- =========================
-- CONTEXT
-- =========================

local function ctx()
    return {
        buf = api.nvim_get_current_buf(),
        win = api.nvim_get_current_win(),
    }
end

local function current_meta(c)
    local ln = api.nvim_win_get_cursor(c.win)[1]
    local lines = vim.b[c.buf].lines or {}
    local m = lines[ln]

    if not m then return nil end

    local root
    for _, L in ipairs(lines) do
        if L.isRoot then
            root = L
            break
        end
    end

    m.root = root
    m.fullPath = m.isRoot and normalize_path(m.name) or add_path(root.name, name(m.name))
    m._line = ln

    return m
end

-- =========================
-- RENDER
-- =========================

local function render(c, path, selectName)
    local lines = {}
    local entries = {}

    local handle = uv.fs_scandir(path)
    if not handle then return end

    while true do
        local n, t = uv.fs_scandir_next(handle)
        if not n then break end
        table.insert(entries, { name = n, isDir = (t == "directory") })
    end

    table.sort(entries, function(a, b)
        if a.isDir ~= b.isDir then return a.isDir end
        return a.name < b.name
    end)

    table.insert(lines, { name = path, isRoot = true, isDir = true, text = path })

    for _, e in ipairs(entries) do
        table.insert(lines, {
            name = add_path(path, e.name),
            isDir = e.isDir,
            text = e.name .. (e.isDir and "/" or ""),
        })
    end

    vim.bo[c.buf].modifiable = true

    api.nvim_buf_set_lines(c.buf, 0, -1, false, vim.tbl_map(function(l) return l.text end, lines))

    vim.bo[c.buf].modifiable = false
    vim.bo[c.buf].modified = false

    api.nvim_buf_clear_namespace(c.buf, ns, 0, -1)

    for i, e in ipairs(lines) do
        if e.isDir then
            api.nvim_buf_add_highlight(c.buf, ns, "Directory", i - 1, 0, -1)
        end
    end

    vim.b[c.buf].lines = lines

    if selectName then
        for i, e in ipairs(lines) do
            if not e.isRoot and name(e.name) == selectName then
                api.nvim_win_set_cursor(c.win, { i, 0 })
                break
            end
        end
    end
end

-- =========================
-- BUFFER HELPERS
-- =========================

--- Busca un buffer por su ruta absoluta y le aplica un wipeout forzado si existe.
--- @param target_path string Ruta absoluta del archivo a limpiar.
function M._wipeout_buffer_by_path(target_path)
    -- Normalizamos la ruta para asegurar una comparación exacta
    local target_full = fn.fnamemodify(target_path, ":p")

    -- Iteramos sobre todos los buffers válidos en Neovim
    for _, buf in ipairs(api.nvim_list_bufs()) do
        if api.nvim_buf_is_valid(buf) then
            local buf_name = api.nvim_buf_get_name(buf)
            local buf_full = fn.fnamemodify(buf_name, ":p")

            if buf_full == target_full then
                -- bwipeout! elimina el buffer, sus marcas, opciones y lo saca de la memoria
                pcall(api.nvim_buf_delete, buf, { force = true })
                break -- Encontrado y eliminado, podemos salir del bucle
            end
        end
    end
end

-- =========================
-- CORE ACTIONS
-- =========================

function M.open(path)
    local input = path or current_file()
    local fullp = full(input)

    if fn.getftype(fullp) == "" then
        fullp = uv.cwd() .. "/"
    end

    local dir = fullp
    local select = nil

    if name(fullp) ~= "" then
        select = name(fullp)
        dir = directory(fullp)
    end

    -- save the buffer from which the user calls the file manager
    local previous_buf = api.nvim_get_current_buf()

    -- create the new file manager buffer
    local buf = api.nvim_create_buf(false, false)
    vim.bo[buf].buftype = ""
    vim.bo[buf].buflisted = false -- Evita que ensucie el :ls
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].undofile = false
    vim.bo[buf].filetype = "fex"

    vim.b[buf].fex_previous_buf = previous_buf

    M._set_keymaps(buf)

    local win = api.nvim_get_current_win()
    api.nvim_win_set_buf(win, buf)

    render(ctx(), dir, select)
end

function M.enter()
    local c = ctx()
    local m = current_meta(c)
    if not m then return end

    if m.isDir then
        render(c, m.fullPath)
    else
        vim.cmd("edit " .. fn.fnameescape(m.fullPath))
    end
end

function M.up()
    local c = ctx()
    local m = current_meta(c)
    if not m or not m.root then return end

    render(c, directory(m.root.name), name(m.root.name))
end

function M.create()
    local c = ctx()
    local m = current_meta(c)
    if not m or not m.root then return end

    local name_input = fn.input("Create (append / for dir): ")
    if name_input == "" then return end

    local is_dir = name_input:sub(-1) == "/"
    local target = add_path(m.root.name, name_input)
    local select = name_input:find("/") and name_input:match("^([^/]+)") or name_input

    if is_dir then
        fn.mkdir(target:gsub("/$", ""), "p")
    else
        fn.mkdir(directory(target), "p")
        local f = io.open(target, "w")
        if f then f:close() end
    end

    render(c, m.root.name, select)
end

function M.delete()
    local c = ctx()
    local m = current_meta(c)
    if not m then return end

    if fn.confirm("Delete " .. m.fullPath .. "?", "&Yes\n&No") == 1 then
        -- Wipe the buffer atached to the removed file
        M._wipeout_buffer_by_path(m.fullPath)

        fn.delete(m.fullPath, m.isDir and "d" or "")

        render(c, m.root.name)
    end
end

function M.rename()
    local c = ctx()
    local m = current_meta(c)
    if not m then return end

    local to = fn.input("Rename to: ", m.fullPath)
    if to == "" then return end

    fn.rename(m.fullPath, to)

    -- Wipe the buffer atached to the old file
    M._wipeout_buffer_by_path(m.fullPath)

    render(c, m.root.name)
end

function M.yank()
    local c = ctx()
    local m = current_meta(c)
    if not m then return end

    fn.setreg("+", m.fullPath)
    print(m.fullPath)
end

function M.close()
    local c = ctx()
    local prev = vim.b[c.buf].fex_previous_buf

    if prev and api.nvim_buf_is_valid(prev) then
        api.nvim_win_set_buf(c.win, prev)
    else
        pcall(vim.cmd, "bwipeout!")
    end
end

-- =========================
-- KEYMAPS
-- =========================

function M._set_keymaps(buf)
    local opts = { buffer = buf, noremap = true, silent = true }

    vim.keymap.set("n", "<CR>", M.enter, opts)
    vim.keymap.set("n", "-", M.up, opts)
    vim.keymap.set("n", "a", M.create, opts)
    vim.keymap.set("n", "d", M.delete, opts)
    vim.keymap.set("n", "r", M.rename, opts)
    vim.keymap.set("n", "y", M.yank, opts)

    -- Mapeos de salida
    vim.keymap.set("n", "q", M.close, opts)
    vim.keymap.set("n", "<C-o>", M.close, opts)
end

return M
