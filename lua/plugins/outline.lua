return {
  'hedyhli/outline.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    {
      '<leader>o',
      function()
        require('outline').open()
      end,
      mode = '',
      desc = 'Open [O]utline',
    },
  },
  config = function()
    require('outline').setup {}
  end,
}
