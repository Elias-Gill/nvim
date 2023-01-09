require("luasnip.loaders.from_vscode").lazy_load() -- to load vscode-like snippets from plugins
-- require'luasnip'.filetype_extend("ruby", {"rails"}) 

--config
local types = require("luasnip.util.types")
require("luasnip").config.set_config {
    history = false,
    updateevents = "TextChanged", "TextChangedI",
    enable_autosnippets = false,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "☞", "Comment" } },
            },
        },
    }
}
