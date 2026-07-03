local api = vim.api
local fn = vim.fn

-- =============================================================================
-- HIJACK DE DIRECTORIOS (Estilo Netrw / Dir.nvim)
-- =============================================================================

local hijack_group = api.nvim_create_augroup("FexHijack", { clear = true })

api.nvim_create_autocmd("BufEnter", {
    group = hijack_group,
    callback = function(ev)
        local path = ev.file

        -- Si el buffer no tiene ruta o no es un directorio real, no hacemos nada
        if path == "" or fn.isdirectory(path) == 0 then
            return
        end

        -- Guardamos el buffer dummy que Neovim le asignó a la carpeta
        local dir_buf = ev.buf

        -- Ejecutamos tu función de apertura pasándole la ruta del directorio
        require('plugins.fex').open(path)

        -- Limpieza: Borramos el buffer dummy original para que no ensucie la memoria
        vim.schedule(function()
            if api.nvim_buf_is_valid(dir_buf) then
                api.nvim_buf_delete(dir_buf, { force = true })
            end
        end)
    end,
})
