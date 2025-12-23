return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },

      use_libuv_file_watcher = true,
    },
  },
}
