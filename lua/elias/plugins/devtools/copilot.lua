return {
	{
		"Exafunction/codeium.vim",
		cmd = "Codeium",
		config = function()
			vim.cmd([[
                let g:codeium_disable_bindings = 1
                imap <script><silent><nowait><expr> <C-l> codeium#Accept()
                imap <C-x>   <Cmd>call codeium#Clear()<CR>
                ]])
		end,
	},

	--[[ -- add this to the file where you setup your other plugins:
	{
		"monkoose/neocodeium",
		cmd = "NeoCodeium",
		config = function()
			local neocodeium = require("neocodeium")
			neocodeium.setup()
			vim.keymap.set("i", "<A-f>", function()
				require("neocodeium").accept()
			end)
			vim.keymap.set("i", "<A-w>", function()
				require("neocodeium").accept_word()
			end)
			vim.keymap.set("i", "<A-l>", function()
				require("neocodeium").accept_line()
			end)
			vim.keymap.set("i", "<A-e>", function()
				require("neocodeium").cycle_or_complete()
			end)
			vim.keymap.set("i", "<A-r>", function()
				require("neocodeium").cycle_or_complete(-1)
			end)
			vim.keymap.set("i", "<A-c>", function()
				require("neocodeium").clear()
			end)
		end,
	}, ]]
}
