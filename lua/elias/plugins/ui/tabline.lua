return {
	-- tabline
	"alvarosevilla95/luatab.nvim",
	event = "TabNew",
	opts = {
		separator = function()
			return ""
		end,
		modified = function(bufnr)
			return vim.fn.getbufvar(bufnr, "&modified") == 1 and "+ " or ""
		end,
		windowCount = function()
			return ""
		end,
	},
}
