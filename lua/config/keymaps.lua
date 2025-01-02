local remapping = vim.keymap.set
local global = vim.g
local opt = vim.opt

-- Set leader key
global.mapleader = " "

-- Set tab width
opt.tabstop = 4

-- Misc function mapping
remapping("n", "<leader>?", "<cmd>WhichKey<cr>",
    { desc = "Open `WhichKey` window'" })                    -- Open `WhichKey` window
remapping("n", "<leader>ft", "<cmd>Telescope current_buffer_fuzzy_find<cr>",
    { desc = "Find text in current buffer with fuzzy way" }) -- Fuzzy search powered by `Telescope`
remapping("n", "<leader>ff", "<cmd>Telescope find_files<cr>",
    { desc = "Find file to open" })                          -- Open `Telescope` window to find file
remapping("n", "<leader>fb", "<cmd>Telescope buffers<cr>",
    { desc = "Find buffer to open" })                        -- Open `Telescope` window to find buffer
remapping("n", "<leader>fp", "<cmd>Telescope live_grep<cr>",
    { desc = "Find text in project with fuzz way" })         -- Search text in project
remapping("n", "<C-e>", "<cmd>NvimTreeFindFile<CR>",
    { desc = "Locate to current buffer file fastly" })       -- Locate to file explorer


-- Remap `:` to Telescope command
remapping({ "n", "v" }, ":", "<cmd>Telescope commands<CR>",
    { desc = "Open command pannel" })

-- Open lazygit floating window
remapping({ "n", "v" }, "<leader>g", "<cmd>LazyGit<cr>",
    { desc = "Open lazygit in floating" })
remapping({ "n", "v" }, "<leader>gf", "<cmd>LazyGitFilter<cr>",
    { desc = "Open lazygit filter for current project" })

-- Copy, cut, paste
-- Copy to system paste board
remapping({ "n", "v" }, '<C-c>', '"+y')
-- Paste from system paste board
remapping({ "n", "v" }, '<C-v>', '"+gP')
-- Cut current text to system paste board
remapping({ "n", "v" }, '<C-x>', '"+d')

-- Comment lines
remapping({ "n", "v" }, "<leader>c", "<Plug>(comment_toggle_linewise_visual)",
    { desc = "Comment selected lines in linewise comment", })

-- Window actions
remapping({ "n", "v" }, "<leader>wj", "<C-w>j",
    { desc = "Move to ↓ window" })
remapping({ "n", "v" }, "<leader>wh", "<C-w>h",
    { desc = "Move to ← window" })
remapping({ "n", "v" }, "<leader>wk", "<C-w>k",
    { desc = "Move to ↑ window" })
remapping({ "n", "v" }, "<leader>wl", "<C-w>l",
    { desc = "Move to → window" })
remapping({ "n", "v" }, "<leader>ww", "<C-w>w",
    { desc = "Switch window" })
remapping({ "n", "v" }, "<leader>wc", "<cmd>bd <cr>",
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
remapping({ "n", "v" }, "<leader>lsh", vim.lsp.buf.signature_help,
    { desc = "Open `signature_help` provided by LSP" })
remapping({ "n", "v" }, "<leader>lrn", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
    end,
    { desc = "Action `rename` provided by LSP" })
remapping({ "n", "v" }, "<leader>lf", vim.lsp.buf.format,
    { desc = "Action `format` provided by LSP" })
remapping({ "n", "v" }, "<leader>lgd", "<cmd>Telescope lsp_definitions<cr>",
    { desc = "Goto definition powered by Telescope" })
remapping({ "n", "v" }, "<leader>lgr", "<cmd>Telescope lsp_references<cr>",
    { desc = "Goto references powered by Telescope" })
remapping({ "n", "v" }, "<leader>lo", "<cmd>Outline<CR>",
    { desc = "Toggle symbol outline" })
remapping({ "n", "v" }, "<leader>ld[", vim.diagnostic.goto_prev,
    { desc = "Goto previous diagnostic" })
remapping({ "n", "v" }, "<leader>ld]", vim.diagnostic.goto_next,
    { desc = "Goto next diagnostic" })
remapping({ "n", "v" }, "<leader>ldw", "<cmd>Telescope diagnostics bufnr=0<cr>",
    { desc = "Open workspace diagnostic in floating" })
remapping({ "n", "v" }, "<leader>ldb", "<cmd>Telescope diagnostics<cr>",
    { desc = "Open buffer diagnostic in floating" })
remapping({ "n", "v" }, "<leader>lh", "<cmd>Lspsaga hover_doc<cr>",
    { desc = "Show document hover for function" })
remapping({ "n", "v" }, "<C-f>", vim.lsp.buf.code_action,
    { desc = "Open `code_action` powered by LSP" })
