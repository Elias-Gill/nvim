-- UI settings
require("dapui").setup({
    mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },

    layouts = {
        {
            elements = {
                { id = "breakpoints", size = 0.25 },
                { id = "scopes", size = 0.30 },
                { id = "watches", size = 0.25 },
                { id = "stacks", size = 0.20 },
            },
            size = 40,
            position = "left", -- Can be "left", "right", "top", "bottom"
        },
        -- puedo agregar  mas tablas aca para agregar otros elementos
    },

    expand_lines = false,
    windows = { indent = 3 },
})

-- listeners para abrir ui automagicamente
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
-- on exit close the UI
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
-- on exit close the UI
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
dap.defaults.fallback.terminal_win_cmd = '9split new'


-- C/C++/Rust Debugger (lldb)
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
    name = 'lldb'
}
dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        args = {},
    },
}

-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
