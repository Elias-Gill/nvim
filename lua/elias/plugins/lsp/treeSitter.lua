local function treeSitterConfig()
	-- Install some default parsers
	require("nvim-treesitter").install({
		"yaml",
		"json",
		"toml",
		"markdown",
		"vimdoc",
		"markdown_inline",
		"lua",
		"javascript",
		"go",
		"bash",
	})

	--vim.g.skip_ts_context_commentstring_module = true
	require("ts_context_commentstring").setup({})

	-- habilitar jumps
	require("nvim-treesitter-textobjects").setup({
		move = {
			set_jumps = true,
		},
	})
	-- == MOVEMENTS ==
	local move = require("nvim-treesitter-textobjects.move")
	-- funciones
	vim.keymap.set({ "n", "x", "o" }, "]f", function()
		move.goto_next_start("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "]F", function()
		move.goto_next_end("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[f", function()
		move.goto_previous_start("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[F", function()
		move.goto_previous_end("@function.outer", "textobjects")
	end)

	-- clases
	vim.keymap.set({ "n", "x", "o" }, "]c", function()
		move.goto_next_start("@class.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "]C", function()
		move.goto_next_end("@class.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[c", function()
		move.goto_previous_start("@class.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[C", function()
		move.goto_previous_end("@class.outer", "textobjects")
	end)

	-- tags
	vim.keymap.set({ "n", "x", "o" }, "]t", function()
		move.goto_next_start("@tag.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "]T", function()
		move.goto_next_end("@tag.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[t", function()
		move.goto_previous_start("@tag.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[T", function()
		move.goto_previous_end("@tag.outer", "textobjects")
	end)

	-- blocks
	vim.keymap.set({ "n", "x", "o" }, "]b", function()
		move.goto_next_start("@block.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "]B", function()
		move.goto_next_end("@block.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[b", function()
		move.goto_previous_start("@block.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[B", function()
		move.goto_previous_end("@block.outer", "textobjects")
	end)

	-- parameters
	vim.keymap.set({ "n", "x", "o" }, "]p", function()
		move.goto_next_start("@parameter.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "]P", function()
		move.goto_next_end("@parameter.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[p", function()
		move.goto_previous_start("@parameter.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[P", function()
		move.goto_previous_end("@parameter.outer", "textobjects")
	end)

	-- ===== SELECCIONES =======
	local select = require("nvim-treesitter-textobjects.select").select_textobject
	---- functions
	vim.keymap.set({ "x", "o" }, "af", function()
		select("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "x", "o" }, "if", function()
		select("@function.inner", "textobjects")
	end)

	-- classes
	vim.keymap.set({ "x", "o" }, "ac", function()
		select("@class.outer", "textobjects")
	end)
	vim.keymap.set({ "x", "o" }, "ic", function()
		select("@class.inner", "textobjects")
	end)

	-- blocks
	vim.keymap.set({ "x", "o" }, "ab", function()
		select("@block.outer", "textobjects")
	end)
	vim.keymap.set({ "x", "o" }, "ib", function()
		select("@block.inner", "textobjects")
	end)

	-- tags
	vim.keymap.set({ "x", "o" }, "at", function()
		select("@tag.outer", "textobjects")
	end)
	vim.keymap.set({ "x", "o" }, "it", function()
		select("@tag.inner", "textobjects")
	end)

	-- parameters
	vim.keymap.set({ "x", "o" }, "aP", function()
		select("@parameter.outer", "textobjects")
	end)
	vim.keymap.set({ "x", "o" }, "iP", function()
		select("@parameter.inner", "textobjects")
	end)

	vim.api.nvim_create_autocmd("FileType", {
		pattern = require("nvim-treesitter").get_installed(),
		callback = function()
			-- syntax highlighting, provided by Neovim
			vim.treesitter.start()
			-- folds, provided by Neovim
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			-- indentation, provided by nvim-treesitter
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end,
	})
end

return {
	-- Tree sitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		config = treeSitterConfig,
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
		},
	},
}
