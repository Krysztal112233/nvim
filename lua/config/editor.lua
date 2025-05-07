-- Configuration for colorschemes
local colors_day = "material"              -- Light colorscheme
local colors_night = "monokai-pro-octagon" -- Dark colorscheme



-- Apply colorscheme based on the time of day
local function apply_colorscheme()
    vim.o.termguicolors = true
    local hour = tonumber(os.date("%H"))
    local scheme = (hour >= 19 or hour < 9)
        and function()
            -- Set darker theme
            vim.cmd.colorscheme(colors_night)
        end
        or function()
            -- Set lighter theme
            vim.cmd.colorscheme(colors_day)
        end

    scheme()

    -- Paired bracket
    vim.cmd("highlight MatchParen guibg=Blue guifg=White gui=bold")
end

apply_colorscheme()

vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
    virtual_lines = true,
})

-- Tab settings
vim.opt.expandtab = true
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.virtualedit = "onemore"
vim.opt.wrap = false

-- Sign define
vim.fn.sign_define("DiagnosticSignError", { text = "E", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "W", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "I ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "H", texthl = "DiagnosticSignHint" })


-- Enable `.editorconfig`
vim.g.editorconfig = true
vim.g.markdown_fenced_languages = {
    "ts=typescript",
}

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})
