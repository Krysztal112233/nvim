local M = {}

function M.opts()
    return {
        keymap = { preset = "enter" },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    }
end

function M.config(_, opts)
    local cmp = require("cmp")

    cmp.setup(opts)
end

return M
