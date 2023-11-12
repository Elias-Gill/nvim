local function cmpConfig()
    local present, cmp = pcall(require, "cmp")
    if not present then
        return
    end

    -- configuracion de vim y lspkind
    vim.opt.completeopt = "menuone,noselect"
    local lspkind = require("lspkind")

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- configuracion general
    cmp.setup({
        -- snippets
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body) -- luasnip
            end,
        },
        window = {
            -- completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        -- lsp symbols and decorators for completation
        formatting = {
            matching = {
                disallow_fuzzy_matching = false,
            },
            format = lspkind.cmp_format({
                mode = "symbol_text", -- show only symbol annotations
                maxwidth = 60,
                -- kind icons
                -- buff
                before = function(_, vim_item)
                    vim_item.kind = string.format("%s", vim_item.kind)
                    --[[ vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snp]",
                    buffer = "[Buf]",
                    nvim_lua = "[]",
                    path = "[]",
                    -- cmp_tabnine = "[📠]",

                })[entry.source.name] ]]
                    return vim_item
                end,
            }),
        },
        -- mappings
        mapping = {
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<UP>"] = cmp.mapping.select_prev_item(),
            ["<DOWN>"] = cmp.mapping.select_next_item(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = false, -- selecciona automaticamente el primer elemento
            }),
        },
        -- sources
        sources = {
            -- this also affects the order in the completion menu
            { name = "luasnip",  max_item_count = 5 },
            { name = "path",     max_item_count = 5 },
            { name = "nvim_lsp", max_item_count = 25 },
            { name = "buffer",   max_item_count = 5 },
        },
    })

    -- Use cmdline & path source for ':'
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })
end

return {
    -- Neovim Cmp (completition engine) and snippets
    {
        "hrsh7th/nvim-cmp",
        event = "VeryLazy",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind.nvim",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            -- {'tzachar/cmp-tabnine', build = './install.sh'}
        },
        config = function()
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
            cmpConfig()
        end
    }
}
