local enabled = true

local function padding_width()
    return math.floor(vim.o.columns * 0.20)
end

local function is_floating(win)
    local cfg = vim.api.nvim_win_get_config(win)
    return cfg.relative ~= ""
end

local function is_quickfix(win)
    local buf = vim.api.nvim_win_get_buf(win)
    return vim.bo[buf].buftype == "quickfix"
end

local function is_fugitive(win)
    local buf = vim.api.nvim_win_get_buf(win)
    return vim.bo[buf].filetype == "fugitive"
end

local function is_help(win)
    local buf = vim.api.nvim_win_get_buf(win)
    return vim.bo[buf].buftype == "help"
end

local function is_padding(win)
    local buf = vim.api.nvim_win_get_buf(win)
    return vim.b[buf].left_padding == true
end

local function is_empty_buffer(win)
    local buf = vim.api.nvim_win_get_buf(win)

    if vim.bo[buf].buftype ~= "" then
        return false
    end

    if vim.api.nvim_buf_get_name(buf) ~= "" then
        return false
    end

    if vim.bo[buf].modified then
        return false
    end

    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

    return #lines == 1 and lines[1] == ""
end

local function find_padding()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if is_padding(win) then
            return win
        end
    end
end

local function real_windows()
    local real = {}

    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if not is_floating(win)
            and not is_quickfix(win)
            and not is_help(win)
            and not is_padding(win)
            and not is_fugitive(win)
        then
            table.insert(real, win)
        end
    end

    return real
end

local function create_padding()
    if find_padding() then
        return
    end

    local current = vim.api.nvim_get_current_win()

    vim.cmd("topleft vsplit")

    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_create_buf(false, true)

    vim.b[buf].left_padding = true

    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].swapfile = false

    vim.api.nvim_win_set_buf(win, buf)

    vim.wo[win].number = false
    vim.wo[win].relativenumber = false
    vim.wo[win].signcolumn = "no"
    vim.wo[win].foldcolumn = "0"
    vim.wo[win].winfixwidth = true

    vim.api.nvim_win_set_width(win, padding_width())

    vim.api.nvim_set_current_win(current)
end

local function remove_padding()
    local win = find_padding()

    if not win then
        return
    end

    pcall(function()
        vim.api.nvim_win_call(win, function()
            vim.cmd("quit")
        end)
    end)
end

local function update()
    if not enabled then
        remove_padding()
        return
    end

    local wins = real_windows()

    if #wins == 1 then
        if is_empty_buffer(wins[1]) then
            remove_padding()
            return
        end

        create_padding()
    else
        remove_padding()
    end
end

vim.api.nvim_create_user_command("TogglePadding", function()
    enabled = not enabled

    if enabled then
        update()
    else
        remove_padding()
    end
end, {})

vim.api.nvim_create_autocmd(
    { "WinNew", "WinClosed", "BufWinEnter", "VimResized" },
    {
        callback = function()
            vim.schedule(update)
        end
    }
)
