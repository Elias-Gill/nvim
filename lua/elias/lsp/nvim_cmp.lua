local present, cmp = pcall(require, "cmp")

if not present then
    return
end

vim.opt.completeopt = "menuone,noselect"
local lspkind = require('lspkind')

cmp.setup({
    -- snippets
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- luasnip
        end,
    },

    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    -- lsp symbols and decorators for completation
    formatting = {
        matching = {
            disallow_fuzzy_matching = false
        },
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50,

            -- kind icons
            before = function(entry, vim_item)
                vim_item.kind = string.format("%s", vim_item.kind)
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snp]",
                    buffer = "[Buf]",
                    nvim_lua = "[Lua]",
                    path = "[Path]",
                    -- cmp_tabnine = "[📠]",

                })[entry.source.name]
                return vim_item
            end
        })
    },
    -- mappings
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<UP>"] = cmp.mapping.select_prev_item(),
        ["<DOWN>"] = cmp.mapping.select_next_item(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    },
    -- sources
    sources = {
        -- this also affects the order in the completion menu
        { name = "luasnip", max_item_count = 5 },
        { name = "nvim_lsp"},
        { name = "path"},
        { name = "buffer", max_item_count = 5 },
    },
})
