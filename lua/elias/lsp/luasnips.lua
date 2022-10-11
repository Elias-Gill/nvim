local ls = require("luasnip")
local types = require("luasnip.util.types")
require("luasnip.loaders.from_vscode").lazy_load() -- to load vscode-like snippets from plugins

-- "Esto es para cuando este trabajando con frameworks y quiera mas snippets"
-- require'luasnip'.filetype_extend("ruby", {"rails"}) 

--config
ls.config.set_config {
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
