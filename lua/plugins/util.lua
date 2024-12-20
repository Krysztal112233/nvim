return {
  -- Floating terminal
  { 'akinsho/toggleterm.nvim', lazy = false,       config = true },

  -- `which-key`, powerful command prompt
  { "folke/which-key.nvim",    event = "VeryLazy", },

  -- Text input modification
  { "stevearc/dressing.nvim",  lazy = false },

  -- Tab bar
  {
    'romgrk/barbar.nvim',
    lazy = false,
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- for git status
      'nvim-tree/nvim-web-devicons', -- for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
  },

  -- Fuzzy file finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Extensible UI for Neovim notifications and LSP progress messages.
  {
    "j-hui/fidget.nvim",
    config = true
  },

  -- Auto pair
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
}
