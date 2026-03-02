return {
  -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup {
      styles = {
        comments = { italic = true }, -- Disable italics in comments
        underline = true,
      },
    }

    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.api.nvim_create_autocmd('VimEnter', {
      group = vim.api.nvim_create_augroup('vanilla-tokyonight', { clear = true }),
      callback = function()
        vim.cmd.colorscheme 'tokyonight-night'

        vim.keymap.set('n', '<leader>tc', function()
          if vim.g.colors_name == 'tokyonight-night' then
            vim.cmd.colorscheme 'tokyonight-day'
          else
            vim.cmd.colorscheme 'tokyonight-night'
          end
        end, { noremap = true, desc = '[T]oggle [C]olorscheme (tokyonight night/day)' })
      end,
    })
  end,
}

