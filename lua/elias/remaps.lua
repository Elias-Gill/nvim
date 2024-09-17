-- Global variables
vim.g.terminal_path = vim.fn.getcwd()

-- Normal mode mappings
vim.keymap.set("n", "<C-\\>", "<C-w>", { silent = true })
vim.keymap.set("n", "U", "<C-r>", { silent = true })

-- Saving files and exit Neovim
vim.keymap.set("n", "<leader>wf", ":w!<CR>", { silent = true })
vim.keymap.set("n", "<leader>wa", ":wa<CR>", { silent = true })
vim.keymap.set("n", "<leader>qa", ":qa<CR>", { silent = true })
vim.keymap.set("n", "<leader>qf", ":q!<CR>", { silent = true })

-- Save all buffers, format and quit
vim.keymap.set("n", "<leader>tt", ":Bw<CR>:qa<CR>", { silent = true })

-- Grep functions
vim.keymap.set("n", "<leader>fw", ":silent grep! <c-r><c-w> **<CR>", { silent = true })
vim.keymap.set("v", "<leader>fw", 'y:silent grep! <c-r>" **<CR>', { silent = true })

-- File managers
vim.keymap.set("n", "-", ":Fex<CR>", { silent = true })
vim.keymap.set("n", "_", ":split | Fex<CR>", { silent = true })
vim.keymap.set("n", "<leader>nt", ":NvimTreeFindFileToggle<CR>", { silent = true })

-- Cycling buffers
vim.keymap.set("n", "[b", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "]b", ":bnext<CR>", { silent = true })

-- Rename buffer
vim.keymap.set("n", "<leader>rn", "%s/", { silent = true })
vim.keymap.set("v", "<leader>rn", ":s/", { silent = true })

-- Rename utils
vim.keymap.set("n", "<leader>rw", 'yiW:%s/<C-r>"//g<left><left>', { silent = true })
vim.keymap.set("v", "<leader>rw", 'y:%s/<C-r>"//g<left><left>', { silent = true })

-- Todo comments
vim.keymap.set("n", "<leader>tg", ":TodoQuickFix<CR>", { silent = true })

-- Quickfix utils
vim.keymap.set("n", "]q", ":cnext<cr>", { silent = true })
vim.keymap.set("n", "[q", ":cprev<cr>", { silent = true })
vim.cmd([[
nnoremap <expr><silent><leader>co empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>:lclose<CR>'
nnoremap <expr><silent><leader>lo empty(filter(getwininfo(), 'v:val.quickfix')) ? ':lopen<CR>' : ':lclose<CR>:cclose<CR>'
]])

-- Change tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<cr>", { silent = true })

-- Center after jumps
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })
vim.keymap.set("n", "<C-t>", "<C-t>zz", { silent = true })
vim.keymap.set("n", "<C-o>", "<C-o>zz", { silent = true })
vim.keymap.set("n", "<C-i>", "<C-i>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })

-- Scroll
vim.keymap.set("n", "<C-y>", "<C-e>", { silent = true })
vim.keymap.set("n", "<C-b>", "<C-y>", { silent = true })

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Shift selections
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

-- Delete/paste utility
vim.keymap.set("v", "<leader>p", '"_dP', { silent = true })
vim.keymap.set("n", "<leader>p", '"_dP', { silent = true })
vim.keymap.set("v", "<leader>d", '"_dD', { silent = true })
vim.keymap.set("n", "x", '"_x', { silent = true })

-- Copy and paste with center and indent
vim.keymap.set("v", "y", "ygv<esc>", { silent = true })
vim.keymap.set("n", "p", "p=`]", { silent = true })

-- Move between splits
vim.keymap.set("n", "<silent><C-j>", ":TmuxNavigateDown<cr>", { silent = true })
vim.keymap.set("n", "<silent><C-k>", ":TmuxNavigateUp<cr>", { silent = true })
vim.keymap.set("n", "<silent><C-h>", ":TmuxNavigateLeft<cr>", { silent = true })
vim.keymap.set("n", "<silent><C-l>", ":TmuxNavigateRight<cr>", { silent = true })

-- Create splits unified with Tmux
vim.keymap.set("n", "<silent><C-w>\\", ":vsplit<cr>", { silent = true })
vim.keymap.set("n", "<silent><C-w>-", ":split<cr>", { silent = true })

-- Configuration files
vim.keymap.set("n", "<leader>cd", ":lcd %:h<CR>", { silent = true })
vim.keymap.set("n", "<silent><leader>sm", ":e $XDG_CONFIG_HOME/nvim/after/plugin/remaps.lua<CR>", { silent = true })
vim.keymap.set("n", "<silent><leader>so", ":e $MYVIMRC<CR>", { silent = true })

-- Open wiki
vim.keymap.set("n", "<silent><leader>ww", ":call OpenWiki()<cr>", { silent = true })
vim.keymap.set("n", "<silent><leader>wo", ":tabnew ~/Documentos/wiki/index.md<cr>:lcd %:h<CR>", { silent = true })

-- Block arrow keys
vim.keymap.set("n", "<up>", "<nop>", { silent = true })
vim.keymap.set("n", "<right>", "<nop>", { silent = true })
vim.keymap.set("n", "<left>", "<nop>", { silent = true })
vim.keymap.set("n", "<down>", "<nop>", { silent = true })

-- Resize splits with arrow keys
vim.keymap.set("n", "<silent><up>", ":resize +5<CR>", { silent = true })
vim.keymap.set("n", "<silent><down>", ":resize -5<CR>", { silent = true })
vim.keymap.set("n", "<silent><left>", ":vertical resize -5<CR>", { silent = true })
vim.keymap.set("n", "<silent><right>", ":vertical resize +5<CR>", { silent = true })

-- Maximizer
vim.keymap.set("n", "<leader>mt", ":MaximizerToggle<cr>", { silent = true })

-- Debug
vim.keymap.set("n", "<silent><leader>db", ":DapContinue<Cr>", { silent = true })
vim.keymap.set("n", "<silent><F7>", ":lua require'dap'.step_into()<cr>", { silent = true })
vim.keymap.set("n", "<silent><F6>", ":lua require'dap'.step_over()<cr>", { silent = true })
vim.keymap.set("n", "<silent><leader>du", ":lua require'dap'.toggle_breakpoint()<Cr>", { silent = true })
vim.keymap.set("n", "<silent><leader>ds", ":lua require'dap'.terminate()<Cr>", { silent = true })
vim.keymap.set(
	"n",
	"<silent><leader>df",
	":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
	{ silent = true }
)
vim.keymap.set("n", "<silent><leader>dc", ":lua require'dap'.run_to_cursor()<Cr>", { silent = true })

-- Luasnips snippets
vim.keymap.set("i", "<Tab>", function()
	return luasnip.expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<Tab>"
end, { expr = true, silent = true })

-- Choice nodes
vim.keymap.set("i", "<C-l>", function()
	return luasnip.choice_active() and "<Plug>luasnip-next-choice" or "<C-E>"
end, { expr = true, silent = true })
vim.keymap.set("s", "<C-l>", function()
	return luasnip.choice_active() and "<Plug>luasnip-next-choice" or "<C-E>"
end, { expr = true, silent = true })
