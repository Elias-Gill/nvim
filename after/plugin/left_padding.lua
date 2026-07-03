local api = vim.api
local M = {}
local enabled = true

-- Grupo de autocomandos limpio para evitar duplicaciones al recargar el archivo
local augroup = api.nvim_create_augroup("LeftPaddingLayout", { clear = true })

-- ================================
-- Funciones de reconocimiento
-- ================================

local function padding_width()
    return math.floor(vim.o.columns * 0.20)
end

-- Revisa de forma segura si una ventana contiene el buffer de padding
local function is_padding(win)
    if not api.nvim_win_is_valid(win) then return false end
    local buf = api.nvim_win_get_buf(win)
    return vim.b[buf].left_padding == true
end

-- Busca el padding en la pestaña actual
local function find_padding()
    for _, win in ipairs(api.nvim_tabpage_list_wins(0)) do
        if is_padding(win) then
            return win
        end
    end
    return nil
end

-- ========================================
-- Operaciones sobre la ventana de padding
-- ========================================

local function create_padding()
    if not enabled or find_padding() then return end

    local current = api.nvim_get_current_win()

    -- Forzamos el split al extremo izquierdo del layout
    vim.cmd("topleft vsplit")
    local win = api.nvim_get_current_win()
    api.nvim_win_set_width(win, padding_width())

    -- Configuración estética moderna usando la metatabla de la ventana (vim.wo)
    local wo = vim.wo[win]
    wo.number = false
    wo.relativenumber = false
    wo.signcolumn = "no"
    wo.foldcolumn = "0"
    wo.winfixwidth = true

    -- Creación y configuración moderna del scratch buffer (vim.bo)
    local buf = api.nvim_create_buf(false, true)
    local bo = vim.bo[buf]
    bo.bufhidden = "wipe"
    bo.undofile = false
    bo.buftype = "nofile"
    bo.filetype = "padding"

    -- Marcamos el buffer y lo asignamos
    vim.b[buf].left_padding = true
    api.nvim_win_set_buf(win, buf)

    -- Devolvemos el foco de forma segura a donde estaba el usuario
    if api.nvim_win_is_valid(current) then
        api.nvim_set_current_win(current)
    end
end

local function remove_padding()
    local win = find_padding()
    if win and api.nvim_win_is_valid(win) then
        api.nvim_win_close(win, true)
    end
end

-- ==========================
-- API, comandos y autocmds
-- ==========================

api.nvim_create_user_command("TogglePadding", function()
    enabled = not enabled
    if enabled then create_padding() else remove_padding() end
end, {})

-- Inicialización del padding al arrancar o cambiar de pestaña
api.nvim_create_autocmd({ "VimEnter", "TabEnter" }, {
    group = augroup,
    callback = function()
        -- Un leve retraso evita parpadeos molestos con dashboards/pantallas de inicio
        vim.defer_fn(create_padding, 20)
    end
})

-- Escucha cuando se cierra cualquier ventana. Si solo queda el padding,
-- cerramos la pestaña/Neovim para no quedarnos atrapados en un buffer muerto.
api.nvim_create_autocmd("WinClosed", {
    group = augroup,
    callback = function()
        -- Esperamos a que Neovim termine de actualizar el árbol de ventanas interno
        vim.schedule(function()
            local wins = api.nvim_tabpage_list_wins(0)

            -- Filtramos para contar únicamente ventanas reales de edición (no flotantes)
            local regular_wins = vim.tbl_filter(function(w)
                return api.nvim_win_is_valid(w) and api.nvim_win_get_config(w).relative == ""
            end, wins)

            -- Si solo queda una ventana normal en el layout y es nuestro padding, salimos
            if #regular_wins == 1 and is_padding(regular_wins[1]) then
                vim.cmd("quit")
            end
        end)
    end
})

return M
