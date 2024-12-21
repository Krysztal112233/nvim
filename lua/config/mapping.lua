local remapping = vim.keymap.set
local global = vim.g
local opt = vim.opt

-- Set leader key
global.mapleader = " "

-- Set tab width
opt.tabstop = 4

-- Misc function mapping
remapping("n", "<leader>?", "<cmd>WhichKey<cr>",
    { desc = "Open `WhichKey` window'" }) -- Open `WhichKey` window
remapping("n", "<leader>ft", "<cmd>Telescope current_buffer_fuzzy_find<cr>",
    { desc = "Find text in current buffer with fuzzy way" })
remapping("n", "<leader>ff", "<cmd>Telescope find_files<cr>",
    { desc = "Find file to open" }) -- Open `Telescope` window
remapping("n", "<leader>fb", "<cmd>Telescope buffers<cr>",
    { desc = "Find buffer to open" })

-- Copy, cut, paste
-- Copy to system paste board
remapping('n', '<C-c>', '"+y')
remapping('v', '<C-c>', '"+y')

-- Paste from system paste board
remapping('n', '<C-v>', '"+gP')
remapping('i', '<C-v>', '<C-r>+')

-- Cut current text to system paste board
remapping('n', '<C-x>', '"+d')
remapping('v', '<C-x>', '"+d')

-- Window actions
remapping("n", "<leader>wj", "<C-w>j",
    { desc = "Move to ↓ window" })
remapping("n", "<leader>wh", "<C-w>h",
    { desc = "Move to ← window" })
remapping("n", "<leader>wk", "<C-w>k",
    { desc = "Move to ↑ window" })
remapping("n", "<leader>wl", "<C-w>l",
    { desc = "Move to → window" })
remapping("n", "<leader>ww", "<C-w>w",
    { desc = "Switch window" })
remapping("n", "<leader>wc", "<cmd>bd <cr>",
    { desc = "Close current window(or buffer)" })

-- File actions
remapping("n", "<C-s>", "<cmd>w<cr>",
    { desc = "Save current buffer" })
remapping("n", "<C-S-s>", "<cmd>wa<cr>",
    { desc = "Save all buffer" })
remapping("n", "<C-q>", "<cmd>xa<cr>",
    { desc = "Save all buffer, and exist nvim" })

-- Terminal mappings
-- Open terminal
remapping("n", "<C-t>t", "<cmd>ToggleTerm size = 20, direction=horizontal start_in_insert=true <cr>",
    { desc = "Open terminal at bottom" })   -- Bottom terminal
remapping("n", "<C-t>f", "<cmd>ToggleTerm  direction=float<cr>",
    { desc = "Open terminal in floating" }) -- Floating terminal
-- Close terminal
remapping("t", "<C-t>t", "<cmd>ToggleTerm size = 20, direction=horizontal start_in_insert=true <cr>",
    { desc = "Open terminal at bottom" })   -- Bottom terminal
remapping("t", "<C-t>f", "<cmd>ToggleTerm  direction=float<cr>",
    { desc = "Open terminal in floating" }) -- Floating terminal

-- LSP function mapping
remapping("n", "<leader>lsh", vim.lsp.buf.signature_help,
    { desc = "Open `signature_help` provided by LSP" })
remapping("n", "<leader>lrn", vim.lsp.buf.rename,
    { desc = "Action `rename` provided by LSP" })
remapping("n", "<leader>lf", vim.lsp.buf.format,
    { desc = "Action `format` provided by LSP" })
remapping("n", "<leader>lca", vim.lsp.buf.code_action,
    { desc = "Open `code_action` provided by LSP" })
remapping("n", "<leader>lgd", vim.lsp.buf.definition,
    { desc = "Goto definition" })
remapping("n", "<leader>lgr", vim.lsp.buf.references,
    { desc = "Goto references" })
remapping("n", "<leader>lo", "<cmd>Outline<CR>",
    { desc = "Toggle symbol outline" })
