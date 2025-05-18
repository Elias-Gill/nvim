vim.keymap.set("n", "a", ":e %/", { remap = true, buffer = true })

vim.keymap.set("n", "<C-r>", "<C-l>", { noremap = true, silent = true, buffer = true })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", { remap = true, silent = true, buffer = true })
vim.keymap.set("n", "q", "<cmd>q<CR>", { remap = true, silent = true, buffer = true })
