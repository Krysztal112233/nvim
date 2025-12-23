vim.cmd 'highlight MatchParen guibg=Blue guifg=White gui=bold'

vim.g.have_nerd_font = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.breakindent = true
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.inccommand = 'split'
vim.o.mouse = 'a'
vim.o.scrolloff = 10
vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true

vim.g.bg = 'light'

vim.opt.clipboard = 'unnamedplus'
vim.g.clipboard = 'osc52'

vim.o.list = true
vim.opt.listchars = require('config').listchar.n

vim.diagnostic.config {
  virtual_lines = false,
  update_in_insert = true,
  virtual_text = true,
}

vim.lsp.inlay_hint.enable(true)

-- Yank highlight
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Auto switch Line number
vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
  callback = function(args)
    local skip_filetypes = {
      ['neo-tree'] = true,
      ['NvimTree'] = true,
      ['Telescope'] = true,
      ['qf'] = true,
      ['help'] = true,
      ['Trouble'] = true,
      ['toggleterm'] = true,
    }

    local ft = vim.bo[args.buf].filetype
    if skip_filetypes[ft] then
      return
    end

    if args.event == 'InsertEnter' then
      vim.wo.number = true
      vim.wo.relativenumber = false
    else
      vim.wo.number = true
      vim.wo.relativenumber = true
    end
  end,
})
vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'CursorHoldI', 'FocusGained' }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { '*' },
})

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('i', 'jk', '<ESC>', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'H', '0', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'L', '$', { noremap = true })

vim.keymap.set({ 'n', 'v' }, '<A-d>', function()
  local isEnable = vim.diagnostic.config().virtual_lines
  vim.diagnostic.config {
    virtual_lines = not isEnable,
    ---@diagnostic disable-next-line: assign-type-mismatch
    virtual_text = isEnable,
  }
end, { noremap = true })
