-- Description -----------------------------------------------------------------------------
--
-- Set the colors of the theme.
--
-- -----------------------------------------------------------------------------------------

local M = {}

function M.get()
	local nano_foreground_color = "#ECEFF4"
	local nano_background_color = "#2E3440"
	local nano_highlight_color = "#3B4252"
	local nano_subtle_color = "#434C5E"
	local nano_faded_color = "#677691"
	local nano_veryfaded_color = "#506071"
	local nano_salient_color = "#81A1C1"
	local nano_strong_color = "#FFFFFF"
	local nano_popout_color = "#D08770"
	local nano_critical_color = "#EBCB8B"

	local blue = "#42A5F5"
	local cyan = "#26C6DA"
	local green = "#66BB6A"
	local magenta = "#AB47BC"
	local red = "#EF5350"
	local yellow = "#E2C12F"

	local colors = {
		-- Colors ------------------------------------------------------------------------------
		nano_foreground_color = nano_foreground_color,
		nano_background_color = nano_background_color,
		nano_highlight_color = nano_highlight_color,
		nano_subtle_color = nano_subtle_color,
		nano_faded_color = nano_faded_color,
		nano_veryfaded_color = nano_veryfaded_color,
		nano_salient_color = nano_salient_color,
		nano_strong_color = nano_strong_color,
		nano_popout_color = nano_popout_color,
		nano_critical_color = nano_critical_color,

		bg = nano_background_color,
		fg = nano_foreground_color,

		bg_alt = nano_highlight_color,
		fg_alt = nano_foreground_color,

		-- Highlight Decoration ----------------------------------------------------------------
		nano_foreground = { fg = nano_foreground_color },
		nano_background = { fg = nano_background_color },
		nano_highlight = { fg = nano_highlight_color },
		nano_subtle = { fg = nano_subtle_color },
		nano_faded = { fg = nano_faded_color },
		nano_veryfaded = { fg = nano_veryfaded_color },
		nano_salient = { fg = nano_salient_color },
		nano_strong = { fg = nano_strong_color, bold = true },
		nano_popout = { fg = nano_popout_color },
		nano_critical = { fg = nano_critical_color },

		-- Terminal Colors ---------------------------------------------------------------------
		terminal_color_0 = nano_faded_color,
		terminal_color_1 = red,
		terminal_color_2 = green,
		terminal_color_3 = yellow,
		terminal_color_4 = blue,
		terminal_color_5 = magenta,
		terminal_color_6 = cyan,
		terminal_color_7 = nano_foreground_color,
		terminal_color_8 = nano_faded_color,
		terminal_color_9 = red,
		terminal_color_10 = green,
		terminal_color_11 = yellow,
		terminal_color_12 = blue,
		terminal_color_13 = magenta,
		terminal_color_14 = cyan,
		terminal_color_15 = nano_foreground_color,
	}

	return colors
end

return M
