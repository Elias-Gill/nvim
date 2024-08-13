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

		keymaps = {
			show_help = "?",
			close = { "<Esc>", "q" },
			-- Jump to symbol under cursor.
			-- It can auto close the outline window when triggered, see
			-- 'auto_close' option above.
			goto_location = "<Cr>",
			-- Jump to symbol under cursor but keep focus on outline window.
			peek_location = "o",
			-- Visit location in code and close outline immediately
			goto_and_close = "<S-Cr>",
			-- Change cursor position of outline window to match current location in code.
			-- 'Opposite' of goto/peek_location.
			restore_location = "<C-g>",
			-- Open LSP/provider-dependent symbol hover information
			hover_symbol = "K",
			-- Preview location code of the symbol under cursor
			rename_symbol = "R",
			code_actions = "a",
			-- These fold actions are collapsing tree nodes, not code folding
			fold = "h",
			unfold = "l",
			fold_toggle = "<Tab>",
			fold_toggle_all = "<S-Tab>",
			fold_all = "W",
			unfold_all = "E",
			down_and_jump = {},
			up_and_jump = {},
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
