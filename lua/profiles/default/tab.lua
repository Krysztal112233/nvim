return {
  'romgrk/barbar.nvim',
  event = 'VeryLazy',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- for git status
    'nvim-tree/nvim-web-devicons', -- for file icons
  },

  -- Disable auto setup
  init = function()
    vim.g.barbar_auto_setup = false
  end,

  config = function()
    require('barbar').setup {
      auto_hide = false,
      tabpages = true,
      icons = {
        -- Add diagnostics to tab bar
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true },
          [vim.diagnostic.severity.WARN] = { enabled = false },
          [vim.diagnostic.severity.INFO] = { enabled = false },
          [vim.diagnostic.severity.HINT] = { enabled = true },
        },
      },
    }

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Move to previous/next
    map({ 'n', 'v' }, '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
    map({ 'n', 'v' }, '<A-.>', '<Cmd>BufferNext<CR>', opts)
    map({ 'n', 'v' }, '<A-q>', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
  end,
  keymap = {},
}
