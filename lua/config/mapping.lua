local keymap = vim.keymap.set
local global = vim.g

-- Set leader key
global.mapleader = " "

-- Misc function mapping
keymap("n", "<leader>?", "<cmd>WhichKey<cr>",
  { desc = "Open `WhichKey`'s window'" }) -- `WhichKey`

-- File actions
keymap("n", "<C-s>", "<cmd>w<cr>",
  { desc = "Save current buffer" })
keymap("n", "<C-s>a", "<cmd>wa<cr>",
  { desc = "Save current buffer" })

-- Terminal mappings
keymap("n", "<C-t>t", "<cmd>ToggleTerm size = 20, direction=horizontal start_in_insert=true <cr>",
  { desc = "Open terminal at bottom" })   -- Bottom terminal
keymap("n", "<C-t>f", "<cmd>ToggleTerm  direction=float<cr>",
  { desc = "Open terminal in floating" }) -- Floating terminal

keymap("t", "<C-t>t", "<cmd>ToggleTerm size = 20, direction=horizontal start_in_insert=true <cr>",
  { desc = "Open terminal at bottom" })   -- Bottom terminal
keymap("t", "<C-t>f", "<cmd>ToggleTerm  direction=float<cr>",
  { desc = "Open terminal in floating" }) -- Floating terminal

-- LSP function mapping
keymap("n", "<leader>sh", vim.lsp.buf.signature_help,
  { desc = "Open `signature_help` provided by LSP" })
keymap("n", "<leader>rn", vim.lsp.buf.rename,
  { desc = "Action `rename` provided by LSP" })
keymap("n", "<leader>f", vim.lsp.buf.format,
  { desc = "Action `format` provided by LSP" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action,
  { desc = "Open `code_action` provided by LSP" })
