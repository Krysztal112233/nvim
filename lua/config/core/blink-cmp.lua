local M = {}

function M.opts()
    return {
        keymap = { preset = "enter" },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        completion = {
            menu = {
                draw = {
                    columns = { { "kind_icon", "label", "label_description", "source_name", gap = 1 } },
                    components = {
                        label_description = { width = { max = 50 } },
                        source_name = {
                            text = function(ctx)
                                return "[" .. ctx.source_name .. "]"
                            end,
                        },
                    },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 2000,
            },
            ghost_text = { enabled = true },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        signature = { enabled = true },
    }
end

function M.config(_, opts)
    local cmp = require("cmp")

    cmp.setup(opts)
end

return M
