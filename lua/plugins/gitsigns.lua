return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, 'Jump to next git [c]hange')

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, 'Jump to previous git [c]hange')

      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'git [s]tage hunk')
      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'git [r]eset hunk')

      map('n', '<leader>hs', gitsigns.stage_hunk, 'git [s]tage hunk')
      map('n', '<leader>hr', gitsigns.reset_hunk, 'git [r]eset hunk')
      map('n', '<leader>hS', gitsigns.stage_buffer, 'git [S]tage buffer')
      map('n', '<leader>hR', gitsigns.reset_buffer, 'git [R]eset buffer')
      map('n', '<leader>hp', gitsigns.preview_hunk, 'git [p]review hunk')
      map('n', '<leader>hi', gitsigns.preview_hunk_inline, 'git preview hunk [i]nline')
      map('n', '<leader>hb', function()
        gitsigns.blame_line { full = true }
      end, 'git [b]lame line')
      map('n', '<leader>hd', gitsigns.diffthis, 'git [d]iff against index')
      map('n', '<leader>hD', function()
        gitsigns.diffthis '@'
      end, 'git [D]iff against last commit')
      map('n', '<leader>hQ', function()
        gitsigns.setqflist 'all'
      end, 'git hunk [Q]uickfix list')
      map('n', '<leader>hq', gitsigns.setqflist, 'git hunk [q]uickfix list')

      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, '[T]oggle git show [b]lame line')
      map('n', '<leader>tw', gitsigns.toggle_word_diff, '[T]oggle git intra-line [w]ord diff')
      map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, 'git hunk')
    end,
  },
}
