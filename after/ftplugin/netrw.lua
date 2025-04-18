local opts = { remap = true, silent = true, buffer = true }

vim.keymap.set("n", "a", "Ccd%:w<CR>", opts)

vim.keymap.set('n', '<C-r>', '<C-l>', { noremap = true, silent = true, buffer = true })
vim.keymap.set('n', '<C-l>', '<cmd>wincmd l<CR>', opts)
vim.keymap.set('n', '<Esc>', '<cmd>q<CR>', opts)
