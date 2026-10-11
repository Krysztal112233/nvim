--- @module "lazy"
return {
  'folke/sidekick.nvim',

  ---@class sidekick.Config
  opts = {
    nes = { enabled = false },

    -- add any options here
    cli = {
      win = {
        keys = {
          buffers = false, -- <c-b>
          files = false, -- <c-f>
          hide_n = false, -- q (normal)
          hide_ctrl_q = false, -- <c-q> (normal)
          hide_ctrl_dot = false, -- <c-.>
          hide_ctrl_z = false, -- <c-z>
          prompt = false, -- <c-p>
          stopinsert = false, -- <c-q> (terminal)
          normal_cr = false, -- <cr> (normal)
          nav_left = false, -- <c-h>
          nav_down = false, -- <c-j>
          nav_up = false, -- <c-k>
          nav_right = false, -- <c-l>
        },
      },
    },
  },

  config = function(_, opts)
    require('sidekick').setup(opts)

    local keep = { pi = true, codex = true, opencode = true }
    local tools = require('sidekick.config').cli.tools
    for name in pairs(tools) do
      if not keep[name] then
        tools[name] = nil
      end
    end
  end,

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
}
