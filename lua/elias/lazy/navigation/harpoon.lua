return {
    'vieitesss/miniharp.nvim',
    version = '*',
    opts = {
        autoload = true,
        autosave = true,
        show_on_autoload = true,
        notifications = false,
        ui = {
            position = 'center',
            show_hints = false,
            enter = true,
            auto_hide = true,
        },
    },
    keys = {
        { "<leader>'",  function() require('miniharp').prev() end,        mode = { "n" }, desc = "Miniharp prev", },
        { "<leader>;",  function() require('miniharp').next() end,        mode = { "n" }, desc = "Miniharp next", },
        { "<leader>hh", function() require('miniharp').toggle_file() end, mode = { "n" }, desc = "Miniharp toggle mark", },
        { "<leader>hu", function() require('miniharp').show_list() end,   mode = { "n" }, desc = "Miniharp list", },
    },
}
