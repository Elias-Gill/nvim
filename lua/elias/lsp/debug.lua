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
dap.defaults.fallback.terminal_win_cmd = "9split new"

-- hightligts and symbols
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#d33939", bg = "#27384d" })
vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61f0ef", bg = "#27384d" })
vim.api.nvim_set_hl(0, "DapStopped", { fg = "#3fc379", bg = "#27384d" })
vim.fn.sign_define(
    "DapBreakpoint",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
    "DapLogPoint",
    { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
)
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
