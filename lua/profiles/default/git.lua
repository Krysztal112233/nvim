return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'lewis6991/gitsigns.nvim',
  },
  config = function()
    require('neogit').setup {
      kind = 'floating',
      signs = {
        hunk = { '', '' },
        item = { '', '' },
        section = { '', '' },
      },
      sections = {
        recent = {
          folded = false,
        },
      },
    }

    vim.keymap.set('n', '<leader>g', '<cmd>Neogit<cr>', { desc = 'Open neo[g]it' })
  end,
}
