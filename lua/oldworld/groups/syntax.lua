local p = require("oldworld.palette")

return {
	Comment = { fg = p.subtext3 },
	Constant = { fg = p.red }, -- any constant
	String = { fg = p.green }, -- a string constant: "this is a string"
	Character = { fg = p.green }, -- a character constant: 'p', '\n'
	Number = { fg = p.magenta }, -- a number constant: 234, 0xff
	Boolean = { fg = p.yellow },
	Float = { fg = p.magenta }, -- a floating point constant: 2.3e10
	Identifier = { fg = p.fg },
	Function = { fg = p.fg },
	Statement = { fg = p.fg }, -- any statement
	Conditional = { fg = p.blue }, -- if, then, else, endif, switch, etc.
	Repeat = { fg = p.purple }, -- for, do, while, etc.
	Label = { fg = p.purple }, -- case, default, etc.
	Operator = { fg = p.yellow }, -- sizeof", "+", "*", etc.
	Keyword = { fg = p.purple },
	Exception = { fg = p.purple }, -- try, catch, throw
	PreProc = { fg = p.red }, -- generic Preprocessor
	Include = { fg = p.purple }, -- preprocessor #include
	Define = { fg = p.red }, -- preprocessor #define
	Macro = { fg = p.red }, -- same as Define
	PreCondit = { fg = p.red }, -- preprocessor #if, #else, #endif, etc.
	Type = { fg = p.yellow }, -- int, long, char, etc.
	StorageClass = { fg = p.yellow }, -- static, register, volatile, etc.
	Structure = { fg = p.red }, -- struct, union, enum, etc.
	Typedef = { fg = p.yellow }, -- A typedef
	Special = { fg = p.blue }, -- any special symbol
	SpecialChar = { fg = p.yellow }, -- special character in a constant
	Tag = { fg = p.yellow }, -- you can use CTRL-] on this
	SpecialComment = { fg = p.subtext4 }, -- special things inside a comment
	Debug = { fg = p.yellow }, -- debugging statements
	Underlined = { underline = true }, -- text that stands out, HTML links
	Error = { fg = p.orange }, -- any erroneous construct
	Todo = { fg = p.yellow }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

	-- HTML
	htmlArg = { fg = p.bright_purple, italic = true }, -- attributes
	htmlEndTag = { fg = p.subtext1 }, -- end tag />
	htmlTitle = { fg = p.fg }, -- title tag text
	htmlTag = { fg = p.subtext1 }, -- tag delimiters
	htmlTagN = { fg = p.subtext1 },
	htmlTagName = { fg = p.red }, -- tag text

	-- Diff
	DiffAdd = { fg = p.bright_green, bg = p.bright_black },
	DiffChange = { fg = p.bright_blue, bg = p.bright_black },
	DiffDelete = { fg = p.bright_red, bg = p.bright_black },
	DiffText = { bg = p.gray2 },

	diffAdded = { fg = p.bright_green, bg = p.bright_black },
	diffChanged = { fg = p.orange, bg = p.bright_black },
	diffNewFile = { fg = p.bright_blue, bold = true },
	diffOldFile = { fg = p.bright_blue, bold = true },
	diffRemoved = { fg = p.bright_red, bg = p.bright_black },
}
