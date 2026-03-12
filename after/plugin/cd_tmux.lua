vim.api.nvim_create_user_command("Cdt", function()
	local res = vim.system({ "tmux", "display-message", "-p", "-F", "#{session_path}" }):wait()
	vim.cmd("lcd" .. res.stdout:gsub('[\n"]', ""))
end, {
	bang = false,
	nargs = 0,
})
