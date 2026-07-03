vim.g.terminal_path = vim.fn.getcwd()

local map = vim.keymap.set

map("i", "<C-\\>", "<C-w>")
map("n", "U", "<C-r>")

-- saving files and exit vim
map("n", "<leader>wa", ":wa<cr>")
map("n", "ZZ", ":qa<cr>")
-- save all buffers, format and quit
map("n", "<leader>tt", ":Bw<cr>:qa<cr>")

-- grep functions
map("n", "<leader>g", ":silent grep! ")
map("n", "grr", ":silent grep! <c-r><c-w> **<cr>")
map("v", "grr", "y:silent grep! <c-r>\" **<cr>")

-- file managers
-- map("n", "-", function() require("fex").open() end, { silent = true })
-- map("n", "-", ":Explore<cr>")

-- cycling buffers
-- map("n", "[b", ":bprevious<CR>")
-- map("n", "]b", ":bnext<CR>")

-- rename in buffer
map("n", "<leader>rn", ":%s/")
map("v", "<leader>rn", ":s/")

-- rename utils
map("n", "grn", "yiw:%s/<c-r>\"//g<left><left>")
map("v", "grn", "y:%s/<c-r>\"//g<left><left>")

-- todo comments
map("n", "<leader>tg", ":TodoQuickFix<CR>", { silent = true })

-- quickfix utils
map("n", "]q", ":cnext<cr>")
map("n", "[q", ":cprev<cr>")

map("n", "<leader>co", function()
    if vim.tbl_isempty(vim.fn.filter(vim.fn.getwininfo(), "v:val.quickfix")) then
        vim.cmd("copen")
    else
        vim.cmd("cclose")
        vim.cmd("lclose")
    end
end, { silent = true })

map("n", "<leader>lo", function()
    if vim.tbl_isempty(vim.fn.filter(vim.fn.getwininfo(), "v:val.quickfix")) then
        vim.cmd("lopen")
    else
        vim.cmd("lclose")
        vim.cmd("cclose")
    end
end, { silent = true })

-- tabs
map("n", "<leader>tn", ":tabnew<cr>")

-- centering
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-t>", "<C-t>zz")
map("n", "<C-o>", "<C-o>zz")
map("n", "<C-i>", "<C-i>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- scroll
map("n", "<C-y>", "<C-e>")
map("n", "<C-b>", "<C-y>")
map("n", "<S-ScrollWheelUp>", "zH")
map("n", "<S-ScrollWheelDown>", "zL")

-- move lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- keep selection on shift
map("v", "<", "<gv")
map("v", ">", ">gv")

-- delete/paste utils
map("v", "<leader>p", "\"_dP")
map("n", "<leader>p", "\"_dP")
map("v", "<leader>d", "\"_dD")
map("n", "x", "\"_x")

-- copy paste
map("v", "y", "ygv<esc>")
map("n", "p", "p=`]")

-- tmux navigation
map("n", "<C-j>", ":TmuxNavigateDown<cr>", { silent = true })
map("n", "<C-k>", ":TmuxNavigateUp<cr>", { silent = true })
map("n", "<C-h>", ":TmuxNavigateLeft<cr>", { silent = true })
map("n", "<C-l>", ":TmuxNavigateRight<cr>", { silent = true })

-- splits
map("n", "<C-w>\\", ":vsplit<cr>", { silent = true })
map("n", "<C-w>-", ":split<cr>", { silent = true })

-- config files
map("n", "<leader>cd", ":lcd %:h<CR>")
map("n", "<leader>sm", ":e $XDG_CONFIG_HOME/nvim/lua/elias/mappings.lua<CR>", { silent = true })
map("n", "<leader>so", ":e $MYVIMRC<CR>", { silent = true })

-- wiki
map("n", "<leader>ww", ":call OpenWiki()<cr>", { silent = true })
map("n", "<leader>wo", ":tabnew ~/Documentos/wiki/index.md<cr>:lcd %:h<CR>", { silent = true })

-- block arrow keys
map("n", "<up>", "<nop>")
map("n", "<right>", "<nop>")
map("n", "<left>", "<nop>")
map("n", "<down>", "<nop>")

-- resize splits
map("n", "<up>", ":resize +2<CR>", { silent = true })
map("n", "<down>", ":resize -2<CR>", { silent = true })
map("n", "<left>", ":vertical resize -5<CR>", { silent = true })
map("n", "<right>", ":vertical resize +5<CR>", { silent = true })

-- maximizer
map("n", "<leader>mt", ":MaximizerToggle<cr>")

-- Luasnip
map("i", "<Tab>", function()
    if vim.fn["luasnip#expand_or_jumpable"]() == 1 then
        return "<Plug>luasnip-expand-or-jump>"
    else
        return "<Tab>"
    end
end, { expr = true, silent = true })

map({ "i", "s" }, "<C-l>", function()
    if vim.fn["luasnip#choice_active"]() == 1 then
        return "<Plug>luasnip-next-choice>"
    else
        return "<C-E>"
    end
end, { expr = true, silent = true })
