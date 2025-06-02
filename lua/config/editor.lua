vim.cmd("highlight MatchParen guibg=Blue guifg=White gui=bold")
vim.cmd.colorscheme("monokai-pro-octagon")

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
vim.opt.tabstop = 3

-- Enable `.editorconfig`
vim.g.editorconfig = true
vim.g.markdown_fenced_languages = { "ts=typescript" }
vim.g.mapleader = " "

vim.o.autoread = true
vim.o.clipboard = "unnamedplus"
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.whichwrap = "<,>,[,]"

vim.wo.cursorline = true

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})

-- Sign define
vim.fn.sign_define("DiagnosticSignError", { text = "E", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "W", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "I ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "H", texthl = "DiagnosticSignHint" })
