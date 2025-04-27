local M = {}

function M.opts()
    return {
        keymap = { preset = "enter" },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
            },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning",
            sorts = {
                'exact',
                'score',
                'sort_text',
            },
        },
        signature = { enabled = true },
    }
end

function M.config(_, opts)
    local cmp = require("cmp")

    cmp.setup(opts)
end

return M
