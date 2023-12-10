local function configSymbols()
	-- symbosl tree
	require("symbols-outline").setup({
		highlight_hovered_item = true,
		position = "right",
		relative_width = true,
		width = 25,
		auto_close = false,
		show_symbol_details = true,
		preview_bg_highlight = "Pmenu",
		autofold_depth = 1,
		auto_unfold_hover = true,
		fold_markers = { "", "" },
		wrap = false,
		symbols = {
			Module = { icon = "", hl = "@namespace" },
			Namespace = { icon = "", hl = "@namespace" },
			Package = { icon = "", hl = "@namespace" },
			Class = { icon = "𝓒", hl = "@yype" },
			Method = { icon = "ƒ", hl = "@method" },
			Property = { icon = "", hl = "@method" },
			Field = { icon = "", hl = "@field" },
			Constructor = { icon = "", hl = "@constructor" },
			Enum = { icon = "ℰ", hl = "@type" },
			Interface = { icon = "ﰮ", hl = "@type" },
			Function = { icon = "", hl = "@function" },
			Variable = { icon = "", hl = "@constant" },
			Constant = { icon = "", hl = "@constant" },
			String = { icon = "𝓐", hl = "@string" },
			Number = { icon = "#", hl = "@number" },
			Boolean = { icon = "⊨", hl = "@boolean" },
			Array = { icon = "", hl = "@constant" },
			Object = { icon = "⦿", hl = "@type" },
			Key = { icon = "🔐", hl = "@type" },
			Null = { icon = "NULL", hl = "@type" },
			EnumMember = { icon = "", hl = "@field" },
			Struct = { icon = "𝓢", hl = "@type" },
			Event = { icon = "🗲", hl = "@type" },
			Operator = { icon = "+", hl = "@operator" },
			TypeParameter = { icon = "𝙏", hl = "@parameter" },
		},
	})
end

return {
	-- Functions tree
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		-- keys = "<leader>vf",
		config = configSymbols,
	},
}
