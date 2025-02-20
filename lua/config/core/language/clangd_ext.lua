local M = {}

function M.config()
    local remapping = vim.keymap.set
    remapping({ "n", "v" }, "<A-h>", "<cmd>ClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })

    vim.notify("ClangdExtension loaded!")
end

function M.opts()
    return {
        inlay_hints = {
            inline = false,
        },
        ast = {
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },
            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            },
        },
    }
end

return M
