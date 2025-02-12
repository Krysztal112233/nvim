local M = {}

function M.opts()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    return {

        -- Add snippet from LuaSnip
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },

        -- Setting order of completion sources
        -- sources = require("config.lsp").cmp_sources,
        sources = cmp.config.sources({
            { name = "nvim_lsp", priority = 1000 },
            { name = "vsnip", priority = 900 },
            { name = "buffer", priority = 600 },
            { name = "path", priority = 100 },
        }),

        formatting = {
            format = require("lspkind").cmp_format({
                maxwidth = {
                    menu = 50, -- leading text (labelDetails)
                    abbr = 50, -- actual suggestion item
                },
                ellipsis_char = "", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                show_labelDetails = true, -- show labelDetails in menu. Disabled by default
                before = function(_, vim_item)
                    return vim_item
                end,
            }),
        },

        -- lunar schema
        mapping = {
            ["<CR>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    if luasnip.expandable() then
                        luasnip.expand()
                    else
                        cmp.confirm({
                            select = true,
                        })
                    end
                else
                    fallback()
                end
            end),

            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.locally_jumpable(1) then
                    luasnip.jump(1)
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        },
    }
end

function M.config(_, opts)
    local cmp = require("cmp")

    cmp.setup(opts)
end

return M
