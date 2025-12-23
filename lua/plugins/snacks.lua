return {
  'folke/snacks.nvim',
  config = function()
    local snacks = require 'snacks'
    snacks.setup {
      indent = {},
      lazygit = {},
      dashboard = {
        formats = {
          key = function(item)
            return { { '[', hl = 'special' }, { item.key, hl = 'key' }, { ']', hl = 'special' } }
          end,
        },
        preset = {
          keys = {
            { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
            { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
          },
        },
        sections = {
          { section = 'header' },
          { section = 'keys', gap = 1 },
          { section = 'startup' },
          {
            pane = 2,
            { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
            { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
            {
              icon = ' ',
              title = 'Git Status',
              section = 'terminal',
              enabled = function()
                return Snacks.git.get_root() ~= nil
              end,
              cmd = 'git status --short --branch --renames',
              height = 5,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            },
          },
        },
      },
    }

    -- Disable ident while enter editinh
    vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
      callback = function(args)
        if args.event == 'InsertEnter' then
          snacks.indent.disable()
          vim.opt.listchars = require('config').listchar.i
        else
          snacks.indent.enable()
          vim.opt.listchars = require('config').listchar.n
        end
      end,
    })
  end,
  keys = {
    {
      '<leader>G',
      function()
        require('snacks').lazygit()
      end,
      desc = 'Lazygit',
    },
  },
  lazy = false,
}
