---@diagnostic disable: undefined-global
local remapping = vim.keymap.set

-- Set `jk` as ESC
remapping("i", "jk", "<ESC>", { noremap = true })
remapping({ "n", "v" }, "H", "0", { noremap = true })
remapping({ "n", "v" }, "L", "$", { noremap = true })

-- Misc function mapping
remapping("n", "<leader>?", "<cmd>WhichKey<cr>", { desc = "Open `WhichKey` window'" })
remapping("n", "<leader>ft", "<cmd>FzfLua lgrep_curbuf<cr>", { desc = "Find text in current buffer with fuzzy way" })
remapping("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find file to open" })
remapping("n", "<leader>fp", "<cmd>FzfLua live_grep<cr>", { desc = "Find text in project with fuzz way" })
remapping({ "n", "v" }, "<C-e>", "<cmd>Neotree<cr>", { desc = "Focus on neotree" })
remapping({ "n", "v" }, "<A-p>", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Open symbols navigator" })

-- Buffer management
remapping("n", "<leader>bl", "<cmd>FzfLua buffers<cr>", { desc = "Open buffer list" })
remapping("n", "<leader>bq", "<cmd>BufferClose<cr>", { desc = "Close current buffer" })
remapping("n", "<leader>bQ", "<cmd>BufferCloseAllButVisible<cr>", { desc = "Close all buffer but current" })

-- Open floating window
remapping({ "n", "v" }, "<leader>g", function()
    require("neogit").open()
end, { desc = "Open neogit in floating" })

-- Comment lines
remapping(
    { "n", "v" },
    "<leader>c",
    "<Plug>(comment_toggle_linewise_visual)",
    { desc = "Comment selected lines in linewise comment" }
)

-- Window actions
remapping({ "n", "v" }, "<leader>wj", "<C-w>j", { desc = "Move to ↓ window" })
remapping({ "n", "v" }, "<leader>wh", "<C-w>h", { desc = "Move to ← window" })
remapping({ "n", "v" }, "<leader>wk", "<C-w>k", { desc = "Move to ↑ window" })
remapping({ "n", "v" }, "<leader>wl", "<C-w>l", { desc = "Move to → window" })
remapping({ "n", "v" }, "<leader>ww", "<C-w>w", { desc = "Switch window" })
remapping({ "n", "v" }, "<leader>wc", "<cmd>bd <cr>", { desc = "Close current window(or buffer)" })

-- File actions
remapping("n", "<C-s>", "<cmd>w<cr>", { desc = "Save current buffer" })
remapping("n", "<C-S-s>", "<cmd>wa<cr>", { desc = "Save all buffer" })

-- Terminal mappings
remapping({ "t", "n" }, "<C-t>", "<cmd>ToggleTerm  direction=float<cr>", { desc = "Open terminal in floating" })

-- LSP function mapping
remapping({ "n", "v" }, "K", vim.lsp.buf.signature_help, { desc = "Open `signature_help` provided by LSP" })
remapping({ "n", "v" }, "<F2>", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
end, { desc = "Action `rename` provided by LSP", expr = true })
remapping({ "n", "v" }, "<leader>lf", require("conform").format, {})
remapping({ "n", "v" }, "<leader>lgd", "<cmd>FzfLua lsp_definitions<cr>", { desc = "Goto definition" })
remapping({ "n", "v" }, "<leader>lgr", "<cmd>FzfLua lsp_references<cr>", { desc = "Goto references powered" })
remapping(
    { "n", "v" },
    "<leader>tw",
    "<cmd>FzfLua diagnostics_workspace<cr>",
    { desc = "Open workspace diagnostic in floating" }
)
remapping(
    { "n", "v" },
    "<leader>tb",
    "<cmd>FzfLua diagnostics_document<cr>",
    { desc = "Open document diagnostic in floating" }
)
remapping({ "n", "v" }, "<C-f>", "<cmd>FzfLua lsp_code_actions<cr>", {})

remapping({ "n", "v" }, "<A-d>", function()
    local enable = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({
        virtual_lines = enable,
    })

    vim.notify(("`virtual_lines`: %s"):format(enable), vim.log.levels.INFO)
end, { desc = "Switch virtualline and lineend diagnostics" })
