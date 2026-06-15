--- @module "lazy"
return {
  'folke/sidekick.nvim',
  opts = {
    nes = { enabled = false },

    -- add any options here
    cli = {
      mux = {
        backend = 'zellij',
        enabled = true,
      },
    },
  },
  keys = {
    {
      '<leader>aa',
      function()
        require('sidekick.cli').toggle { filter = { installed = true } }
      end,
      desc = 'Sidekick Toggle CLI',
    },
    {
      '<leader>at',
      function()
        require('sidekick.cli').send { msg = '{this}' }
      end,
      mode = { 'x', 'n' },
      desc = 'Send This',
    },
    {
      '<leader>af',
      function()
        require('sidekick.cli').send { msg = '{file}' }
      end,
      desc = 'Send File',
    },
    {
      '<leader>av',
      function()
        require('sidekick.cli').send { msg = '{selection}' }
      end,
      mode = { 'x' },
      desc = 'Send Visual Selection',
    },
  },
  config = function(opts)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'sidekick_terminal',
      callback = function(event)
        vim.keymap.set('t', '<C-j>', '<PageUp>', {
          buffer = event.buf,
          noremap = true,
          silent = true,
          desc = 'Sidekick terminal page up',
        })
        vim.keymap.set('t', '<C-k>', '<PageDown>', {
          buffer = event.buf,
          noremap = true,
          silent = true,
          desc = 'Sidekick terminal page down',
        })
      end,
    })

    require('sidekick').setup(opts)
  end,
}
