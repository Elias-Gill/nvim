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

    -- LUA ALTERNATIVE
    -- "monkoose/neocodeium"
}
