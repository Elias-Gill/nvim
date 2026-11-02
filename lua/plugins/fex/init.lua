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

local function join(p, part)
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

    -- Root is always the first line, inserted by render
    m.root = lines[1]
    m.fullPath = m.isRoot and normalize_path(m.name) or m.name
    m._line = ln

    return m
end

-- =========================
-- RENDER
-- =========================

local function render(c, path, selectName)
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

    local lines = { { name = path, isRoot = true, isDir = true, text = path } }
    local texts = { path }
    local last_dir_row = 0

    for _, e in ipairs(entries) do
        local text = e.name .. (e.isDir and "/" or "")
        table.insert(lines, {
            name = join(path, e.name),
            isDir = e.isDir,
            text = text,
            base = e.name,
        })
        table.insert(texts, text)
        if e.isDir then last_dir_row = #lines - 1 end
    end

    vim.bo[c.buf].modifiable = true

    api.nvim_buf_set_lines(c.buf, 0, -1, false, texts)

    vim.bo[c.buf].modifiable = false
    vim.bo[c.buf].modified = false

    api.nvim_buf_clear_namespace(c.buf, ns, 0, -1)

    -- Directories are sorted first, so a single extmark covers all of them
    api.nvim_buf_set_extmark(c.buf, ns, 0, 0, {
        end_row = last_dir_row,
        end_col = #texts[last_dir_row + 1],
        hl_group = "Directory",
    })

    vim.b[c.buf].lines = lines

    if selectName then
        for i, e in ipairs(lines) do
            if not e.isRoot and e.base == selectName then
                api.nvim_win_set_cursor(c.win, { i, 0 })
                break
            end
        end
    end
end

-- =========================
-- BUFFER HELPERS
-- =========================

--- Wipe buffers attached to a path. With recursive, also wipes nested files.
--- @param target_path string Absolute path of the file or directory.
--- @param recursive boolean Wipe buffers under the directory recursively.
function M._wipeout_buffer_by_path(target_path, recursive)
    local target = full(target_path):gsub("/+$", "")
    local prefix = target .. "/"

    for _, buf in ipairs(api.nvim_list_bufs()) do
        if api.nvim_buf_is_valid(buf) then
            local buf_full = api.nvim_buf_get_name(buf):gsub("/+$", "")
            local matches = buf_full == target
                or (recursive and vim.startswith(buf_full, prefix))

            if matches then
                pcall(api.nvim_buf_delete, buf, { force = true })
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
    local target = join(m.root.name, name_input)
    local select = name_input:find("/") and name_input:match("^([^/]+)") or name_input

    if not is_dir and fn.getftype(target) ~= "" then
        local choice = fn.confirm("File already exists:\n" .. target .. "\nOverwrite?", "&Yes\n&No")
        if choice ~= 1 then return end
    end

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

    if m.isRoot then
        vim.notify("fex: cannot delete the current root directory", vim.log.levels.WARN)
        return
    end

    local message = m.isDir
        and ("Delete directory " .. m.fullPath .. " and all its contents?")
        or ("Delete " .. m.fullPath .. "?")

    if fn.confirm(message, "&Yes\n&No") == 1 then
        -- Wipe the buffers attached to the removed file or its children
        M._wipeout_buffer_by_path(m.fullPath, m.isDir)

        -- "rf" deletes directories recursively
        fn.delete(m.fullPath, m.isDir and "rf" or "")

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
