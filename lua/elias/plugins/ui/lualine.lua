local function trim(s)
	return (s:gsub("^%s*(.-)%s*$", "%1"))
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	event = "VeryLazy",
	config = function()
		-- Eviline config for lualine
		-- Author: shadmansaleh
		-- Credit: glepnir
		local lualine = require("lualine")

        -- Color table for highlights
        -- stylua: ignore
        local colors = {
            bg       = '#2f2f2f',
            fg       = '#bbc2cf',
            yellow   = '#ECBE7B',
            cyan     = '#008080',
            darkblue = '#081633',
            green    = '#98be65',
            orange   = '#FF8800',
            violet   = '#a9a1e1',
            magenta  = '#c678dd',
            blue     = '#51afef',
            red      = '#ec5f67',
        }

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		-- Config
		local config = {
			options = {
				-- Disable sections and component separators
				component_separators = "",
				section_separators = "",
				theme = {
					-- We are going to use lualine_c an lualine_x as left and
					-- right section. Both are highlighted by c theme .  So we
					-- are just setting default looks o statusline
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.fg, bg = colors.bg } },
				},
			},
			sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- These will be filled later
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}

		-- Inserts a component in lualine_c at left section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- Inserts a component in lualine_x at right section
		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		ins_left({
			-- mode component
			function()
				return "▊"
				-- return ""
			end,
			color = function()
				-- auto change color according to neovims mode
				local mode_color = {
					n = colors.blue,
					i = colors.green,
					v = colors.red,
					[""] = colors.red,
					V = colors.red,
					c = colors.magenta,
					no = colors.red,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					R = colors.violet,
					Rv = colors.violet,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.red,
					t = colors.red,
				}
				return { fg = mode_color[vim.fn.mode()] }
			end,
			padding = { right = 1 },
		})

		ins_left({
			-- Lsp server name .
			function()
				local msg = "No Active Lsp"
				local prompt = ""
				local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
				local clients = vim.lsp.get_active_clients()

				if next(clients) == nil then
					return msg
				end

				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						prompt = prompt .. " " .. client.name
					end
				end

				return trim(prompt)
			end,
			icon = " :",
			color = { fg = colors.yellow },
		})

		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			diagnostics_color = {
				color_error = { fg = "DiagnosticError" },
				color_warn = { fg = "DiagnosticWarn" },
				color_info = { fg = "DiagnosticInfo" },
			},
		})

		--- Insert mid section. ---
		ins_left({
			function()
				return "%="
			end,
		})

		ins_left({
			"filename",
			cond = conditions.buffer_not_empty,
			path = 1, -- 1: Relative path
			color = { fg = "#eeeeee", gui = "bold" },
		})

		--- right status ---
		ins_right({
			"branch",
			icon = "",
			color = { fg = colors.violet, gui = "bold" },
		})

		ins_right({
			"location",
			padding = { left = 0, right = 0 }, -- We don't need space before this
		})

		ins_right({
			"progress",
			padding = { left = 1, right = 0 }, -- We don't need space before this
			color = { fg = colors.fg, gui = "bold" },
		})

		ins_right({
			-- filesize component
			"filesize",
			cond = conditions.buffer_not_empty,
		})

		ins_right({
			function()
				return "▊"
			end,
			color = { fg = colors.blue },
			padding = { left = 1 },
		})

		-- Now don't forget to initialize lualine
		lualine.setup(config)
	end,
}
