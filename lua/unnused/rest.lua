return {
	"rest-nvim/rest.nvim",
	ft = "http",
	config = function()
		require("rest-nvim").setup({
			-- Skip SSL verification, useful for unknown certificates
			skip_ssl_verification = true,
			result = {
				-- toggle showing URL, HTTP info, headers at top the of result window
				show_url = true,
				-- show the generated curl command in case you want to launch
				-- the same request via the terminal (can be verbose)
				show_curl_command = true,
				-- executables or functions for formatting response body [optional]
				-- set them to false if you want to disable them
				formatters = {
					json = function(body)
						return vim.fn.system({ "jq" }, body)
					end,

					html = function(body)
						return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
					end,
				},
			},
			-- Jump to request line on run
			jump_to_request = true,
			env_file = ".env",
			custom_dynamic_variables = {},
			yank_dry_run = true,
		})
		vim.cmd([[
        function YourFunction()
            setlocal filetype=http
            nnoremap <buffer> <leader>o <Plug>RestNvim
            nnoremap <buffer> <leader>p <Plug>RestNvimLast
            nnoremap <buffer> <leader>c <Plug>RestNvimPreview
        endfunction
        autocmd BufEnter *.http call YourFunction()
        ]])
	end,
}
