local function on_attach(bufnr)
	local api = require("nvim-tree.api")
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	vim.keymap.set("n", "cd", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "K", api.node.show_info_popup, opts("Info"))
	vim.keymap.set("n", "R", api.fs.rename_sub, opts("Rename: Omit Filename"))
	vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "a", api.fs.create, opts("Create"))
	vim.keymap.set("n", "C", api.fs.copy.node, opts("Copy"))
	vim.keymap.set("n", "<C-c>", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
	vim.keymap.set("n", "[g", api.node.navigate.git.prev, opts("Prev Git"))
	vim.keymap.set("n", "]g", api.node.navigate.git.next, opts("Next Git"))
	vim.keymap.set("n", "D", api.fs.remove, opts("Delete"))
	vim.keymap.set("n", "d", api.fs.trash, opts("Trash"))
	vim.keymap.set("n", "]d", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
	vim.keymap.set("n", "[d", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "y", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
	vim.keymap.set("n", "i", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
	vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
	vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
	vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
	vim.keymap.set("n", "q", api.tree.close, opts("Close"))
	vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
	vim.keymap.set("n", "<C-r>", api.tree.reload, opts("Refresh"))
	vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
	vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
end

local function conf_nvimtree()
	require("nvim-tree").setup({
		-- BEGIN_DEFAULT_OPTS
		hijack_cursor = true,
		disable_netrw = false,
		hijack_netrw = false,
		open_on_tab = false,
		sync_root_with_cwd = true,
		reload_on_bufenter = true,
		auto_reload_on_write = true,
		respect_buf_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = false,
		},
		view = {
			width = 32,
			signcolumn = "no",
		},
		renderer = {
			indent_markers = { enable = false },
			group_empty = true,
			icons = {
				glyphs = {
					git = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "👀",
						deleted = "",
						ignored = "? ",
					},
				},
			},
			special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		},
		filters = {
			dotfiles = true,
			custom = {"node_modules"},
		},
		filesystem_watchers = { enable = false },
		git = { enable = false }, -- PERFORMANCE issues
		actions = {
			use_system_clipboard = true,
			change_dir = {
				enable = true,
				global = false,
				restrict_above_cwd = false,
			},
			expand_all = {
				max_folder_discovery = 50,
			},
		},
		trash = {
			cmd = "trash",
			require_confirm = true,
		},
		-- mappings
		on_attach = on_attach,
	})

	-- autoclose on quit
	vim.api.nvim_create_autocmd("BufEnter", {
		command = "if winnr('$') == 1 && bufname() =~ 'NvimTree_' . tabpagenr() | quit | endif",
		nested = true,
	})
	-- Open on setup
	require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
end

return {
	"kyazdani42/nvim-tree.lua",
	event = "UIEnter",
	config = conf_nvimtree,
}
