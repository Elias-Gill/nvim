local p = require("plugins.oldworld.palette")

return {
    -- Headings (consistentes, vibrantes, jerárquicos)
    markdownH1 = { fg = p.bright_blue, bold = true },
    markdownH2 = { fg = p.bright_orange, bold = true },
    markdownH3 = { fg = p.bright_green, bold = true },
    markdownH4 = { fg = p.bright_cyan, bold = true },
    markdownH5 = { fg = p.bright_magenta, bold = true },
    markdownH6 = { fg = p.bright_red, bold = true },

    ["@markup.heading.1"] = { fg = p.bright_blue, bold = true },
    ["@markup.heading.2"] = { fg = p.bright_orange, bold = true },
    ["@markup.heading.3"] = { fg = p.bright_green, bold = true },
    ["@markup.heading.4"] = { fg = p.bright_cyan, bold = true },
    ["@markup.heading.5"] = { fg = p.bright_magenta, bold = true },
    ["@markup.heading.6"] = { fg = p.bright_red, bold = true },

    -- Delimiters, Rules, Markers (neutros, sobrios)
    markdownHeadingDelimiter = { fg = p.subtext4 },
    markdownHeadingRule = { fg = p.subtext4 },
    markdownLineStart = { fg = p.subtext4 },
    markdownRule = { fg = p.subtext4 },
    markdownListMarker = { fg = p.subtext4 },
    markdownOrderedListMarker = { fg = p.subtext4 },

    -- Identifiers (ligeramente distintos)
    markdownId = { fg = p.fg },
    markdownIdDeclaration = { fg = p.bright_magenta },
    markdownIdDelimiter = { fg = p.red },

    -- Links (claros, accesibles)
    markdownLinkDelimiter = { fg = p.subtext4 },
    markdownLinkText = { fg = p.purple, italic = true },
    markdownUrl = { fg = p.green },

    -- Code / Blockquote (resaltados)
    markdownBlockquote = { fg = p.fg },
    markdownCode = { fg = p.yellow },
    markdownCodeBlock = { fg = p.yellow },
    markdownCodeDelimiter = { fg = p.subtext4 },

    -- Inline Styles
    markdownBold = { fg = p.bright_red, bold = true },
    markdownItalic = { fg = p.bright_cyan, italic = true },

    -- MarkView Plugin (consistentes con los headers y links)
    MarkViewHeading1 = { fg = p.bright_blue, bold = true },
    MarkViewHeading2 = { fg = p.bright_orange, bold = true },
    MarkViewHeading3 = { fg = p.bright_green, bold = true },
    MarkViewHeading4 = { fg = p.bright_cyan, bold = true },
    MarkViewHeading5 = { fg = p.bright_magenta, bold = true },
    MarkViewHeading6 = { fg = p.bright_red, bold = true },

    MarkViewHyperLink = { fg = p.fg, bold = true },
    MarkViewImageLink = { fg = p.bright_green, bold = true },
}
