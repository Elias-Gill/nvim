local function preguntar()
    vim.ui.input({ prompt = 'New File: ' }, function(input)
        if (input ~= nil) then
            vim.cmd('e ' .. input)
            vim.api.nvim_feedkeys("i", 'n', {})
        end
    end)
end

return {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup({
            theme = 'hyper', --  theme is doom and hyper default is hyper
            disable_move = true,
            shortcut_type = "number",
            hide = {
                statusline = false,
            },
            config = {
                header = {
                    " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ",
                    " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ",
                    " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ",
                    " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ",
                    " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ",
                    " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ",
                    "",
                },
                packages = { enable = true }, -- show how many plugins neovim loaded
                project = { enable = true, limit = 2, action = 'Telescope find_files cwd=' },
                mru = { limit = 6 },
                shortcut = { { desc = "New file", group = 'WLmagenta_black', key = 'i', action = preguntar }, },
            }
        })
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
