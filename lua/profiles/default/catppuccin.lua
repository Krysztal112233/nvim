return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    require('catppuccin').setup {
      auto_integrations = true,
      flavour = 'mocha',
      background = {
        light = 'latte',
        dark = 'mocha',
      },
      styles = {
        comments = { 'italic' },
      },
    }

    vim.api.nvim_create_autocmd('VimEnter', {
      group = vim.api.nvim_create_augroup('vanilla-catppuccin', { clear = true }),
      callback = function()
        vim.o.background = 'dark'
        vim.cmd.colorscheme 'catppuccin-mocha'

        vim.keymap.set('n', '<leader>tc', function()
          if vim.g.colors_name == 'catppuccin-mocha' then
            vim.cmd.colorscheme 'catppuccin-latte'
          else
            vim.cmd.colorscheme 'catppuccin-mocha'
          end
        end, { noremap = true, desc = '[T]oggle [C]olorscheme (catppuccin mocha/latte)' })
      end,
    })
  end,
}
