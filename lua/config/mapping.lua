local keymap = vim.keymap.set
local global = vim.g
local opt = vim.opt

-- Set leader key
global.mapleader = " "

-- Set tab width
opt.tabstop = 4

-- Misc function mapping
keymap("n", "<leader>?", "<cmd>WhichKey<cr>",
  { desc = "Open `WhichKey`'s window'" }) -- `WhichKey`

-- Window actions
keymap("n", "<leader>wj", "<C-w>j",
  { desc = "Move to ↓ window" })
keymap("n", "<leader>wh", "<C-w>h",
  { desc = "Move to ← window" })
keymap("n", "<leader>wk", "<C-w>k",
  { desc = "Move to ↑ window" })
keymap("n", "<leader>wl", "<C-w>l",
  { desc = "Move to → window" })
keymap("n", "<leader>ww", "<C-w>l",
  { desc = "Switch window" })

-- File actions
keymap("n", "<C-s>", "<cmd>w<cr>",
  { desc = "Save current buffer" })
keymap("n", "<C-s>a", "<cmd>wa<cr>",
  { desc = "Save all buffer" })
keymap("n", "<C-q>", "<cmd>xa<cr>",
  { desc = "Save all buffer, and exist nvim" })

-- Terminal mappings
-- Open terminal
keymap("n", "<C-t>t", "<cmd>ToggleTerm size = 20, direction=horizontal start_in_insert=true <cr>",
  { desc = "Open terminal at bottom" })   -- Bottom terminal
keymap("n", "<C-t>f", "<cmd>ToggleTerm  direction=float<cr>",
  { desc = "Open terminal in floating" }) -- Floating terminal
-- Close terminal
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
keymap("n", "<leader>gd", vim.lsp.buf.definition,
  { desc = "Goto definition" })
keymap("n", "<leader>gr", vim.lsp.buf.references,
  { desc = "Goto references" })
