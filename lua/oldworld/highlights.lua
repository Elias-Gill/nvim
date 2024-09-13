local editor_highlights = require("oldworld.groups.editor")
local syntax_highlights = require("oldworld.groups.syntax")
local terminal = require("oldworld.terminal")

local M = {}

local integrations = {
	cmp = require("oldworld.groups.integrations.cmp"),
    bqf = require("oldworld.groups.integrations.bqf"),
	gitsigns = require("oldworld.groups.integrations.gitsigns"),
	indent_blankline = require("oldworld.groups.integrations.indent_blankline"),
	lazy = require("oldworld.groups.integrations.lazy"),
	lsp = require("oldworld.groups.integrations.lsp"),
	markdown = require("oldworld.groups.integrations.markdown"),
	mason = require("oldworld.groups.integrations.mason"),
	telescope = require("oldworld.groups.integrations.telescope"),
	treesitter = require("oldworld.groups.integrations.treesitter"),
}

local function load_highlights(highlights)
	for group_name, group_settings in pairs(highlights) do
		vim.api.nvim_set_hl(0, group_name, group_settings)
	end
end

function M.setup()
	load_highlights(editor_highlights)
	load_highlights(syntax_highlights)
	for _, plugin in ipairs(integrations) do
        load_highlights(plugin.highlights)
    end
end

return M
