return {
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {
			bind = false,
			max_height = 8,
			max_width = 60,
			floating_window_above_cur_line = false,
			noice = false, -- render markdown
			transparency = nil,

			-- hint_prefix = "🐼 ",
			-- hint_scheme = "String",
			hint_enable = false,
			doc_lines = 0,

			-- hi_parameter = "LspSignatureActiveParameter",
			hi_parameter = "IncSearch",
			handler_opts = {
				border = "rounded", -- double, rounded, single, shadow, none, or a table of borders
			},

			always_trigger = true,
			floating_window = true,
			fix_pos = true, -- not auto-close floting window until finish all parameters
			floating_window_off_x = function()
				return vim.fn.winwidth(0)
			end,
			floating_window_off_y = function()
				return vim.fn.winheight(0) - 1
			end,
		},
	},
}
