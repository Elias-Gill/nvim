return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>ol", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		-- Your setup opts here
		outline_window = {
			position = "left", -- right/left
			width = 18,
			wrap = false,
		},
		outline_items = {
			auto_set_cursor = false,
			-- Autocmd events to automatically trigger these operations.
			auto_update_events = {
				follow = {},
				-- :OutlineRefresh command.
				items = {},
			},
		},
		providers = {
			priority = { "lsp", "coc", "markdown", "norg" },
			lsp = {
				blacklist_clients = {},
			},
			markdown = {
				-- List of supported ft's to use the markdown provider
				filetypes = { "markdown" },
			},
		},

		symbols = {
			filter = { "String", "Module", "Package", exclude = true },
			icons = {
				File = { icon = "󰈔", hl = "Identifier" },
				Module = { icon = "󰆧", hl = "Include" },
				Namespace = { icon = "󰅪", hl = "Include" },
				Package = { icon = "󰏗", hl = "Include" },
				Class = { icon = "𝓒", hl = "Type" },
				Method = { icon = "ƒ", hl = "Function" },
				Property = { icon = "", hl = "Identifier" },
				Field = { icon = "󰆨", hl = "Identifier" },
				Constructor = { icon = "", hl = "Special" },
				Enum = { icon = "ℰ", hl = "Type" },
				Interface = { icon = "󰜰", hl = "Type" },
				Function = { icon = "", hl = "Function" },
				Variable = { icon = "", hl = "Constant" },
				Constant = { icon = "", hl = "Constant" },
				String = { icon = "𝓐", hl = "String" },
				Number = { icon = "#", hl = "Number" },
				Boolean = { icon = "⊨", hl = "Boolean" },
				Array = { icon = "󰅪", hl = "Constant" },
				Object = { icon = "⦿", hl = "Type" },
				Key = { icon = "🔐", hl = "Type" },
				Null = { icon = "NULL", hl = "Type" },
				EnumMember = { icon = "", hl = "Identifier" },
				Struct = { icon = "𝓢", hl = "Structure" },
				Event = { icon = "🗲", hl = "Type" },
				Operator = { icon = "+", hl = "Identifier" },
				TypeParameter = { icon = "𝙏", hl = "Identifier" },
				Component = { icon = "󰅴", hl = "Function" },
				Fragment = { icon = "󰅴", hl = "Constant" },
				TypeAlias = { icon = " ", hl = "Type" },
				Parameter = { icon = " ", hl = "Identifier" },
				StaticMethod = { icon = " ", hl = "Function" },
				Macro = { icon = " ", hl = "Function" },
			},
		},
	},
}
