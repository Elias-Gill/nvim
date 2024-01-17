return {
	"MeanderingProgrammer/harpoon-core.nvim",
	config = function()
		require("harpoon-core").setup({})
	end,
	event = "BufAdd",
	keys = {
		{
			"<leader>'",
			"<cmd>lua require('harpoon-core.ui').nav_prev()<cr>zz",
			mode = { "n" },
			desc = "Harpoon prev",
		},
		{
			"<leader>;",
			"<cmd>lua require('harpoon-core.ui').nav_next()<cr>zz",
			mode = { "n" },
			desc = "Harpoon Next",
		},
		{
			"<leader>hh",
			"<cmd>lua require('harpoon-core.mark').add_file()<cr>",
			mode = { "n" },
			desc = "Harpoon add Mark",
		},
		{
			"<leader>hu",
			"<cmd>lua require('harpoon-core.ui').toggle_quick_menu()<cr>",
			mode = { "n" },
			desc = "Harpoon ui",
		},
	},
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
