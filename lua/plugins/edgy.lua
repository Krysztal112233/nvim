--- @module 'lazy'
--- @module "edgy"
--- @type LazyPluginSpec
return {
  'folke/edgy.nvim',
  event = 'VeryLazy',
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = 'screen'
  end,
  opts = {
    --- @type (Edgy.View.Opts|string)[]
    bottom = {
      {
        ft = 'toggleterm',
        size = { height = 0.4 },
        ---@diagnostic disable-next-line: unused-local
        filter = function(_buf, win)
          -- exclude floating windows
          return vim.api.nvim_win_get_config(win).relative == ''
        end,
      },

      ---@diagnostic disable-next-line: assign-type-mismatch
      { ft = 'qf', title = 'QuickFix' },
    },
    --- @type (Edgy.View.Opts|string)[]
    left = {
      {
        ft = 'neo-tree',
        ---@diagnostic disable-next-line: assign-type-mismatch
        title = 'Filesystem',
      },
    },
    --- @type (Edgy.View.Opts|string)[]
    right = {
      {
        ---@diagnostic disable-next-line: assign-type-mismatch
        title = 'Outline',
        ft = 'Outline',
        pinned = true,
        open = 'Outline',
      },
    },
  },
}
