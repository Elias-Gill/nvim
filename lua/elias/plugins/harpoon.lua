return {
	"MeanderingProgrammer/harpoon-core.nvim",
	config = function()
		require("harpoon-core").setup({})
		vim.cmd([[
            nnoremap <silent><leader>' :lua require("harpoon-core.ui").nav_next()<cr>
            nnoremap <silent><leader>; :lua require("harpoon-core.ui").nav_prev()<cr>
            nnoremap <silent><leader>hh :lua require("harpoon-core.mark").add_file()<cr>
            nnoremap <silent><leader>hu :lua require("harpoon-core.ui").toggle_quick_menu()<cr>
            ]])
	end,
	event = "BufAdd",
}

-- coconut oil navigation
--[[ return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "BufAdd",
    config = function()
        local harpoon = require("harpoon")
        -- REQUIRED
        harpoon:setup()
        vim.cmd([[
                nnoremap <silent><leader>hh :lua require("harpoon"):list():append()<cr>
                nnoremap <silent><leader>hu :lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<cr>
                nnoremap <silent><leader>' :lua require("harpoon"):list():next()<cr>
                nnoremap <silent><leader>; :lua require("harpoon"):list():prev()<cr>
                \]\]
    end,
} ]]
