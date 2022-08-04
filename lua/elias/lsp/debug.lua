require('dap-go').setup()
require('dap-python').setup("/home/elias/.virtualenvs/debugpy/bin/python")
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
                { id = "breakpoints", size = 0.25},
                { id = "scopes", size = 0.30},
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
-- External terminal
--[[ dap.defaults.fallback.force_external_terminal = true
dap.defaults.fallback.external_terminal = {
    command = '/usr/bin/alacritty';
    args = {'-e'};
} ]]

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

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}
-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
