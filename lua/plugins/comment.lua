return {
  'numToStr/Comment.nvim',
  event = 'BufEnter',
  config = function()
    vim.keymap.set({ 'n', 'v' }, '<leader>c', '<Plug>(comment_toggle_linewise_visual)', { desc = '[C]omment selected lines in linewise comment' })
  end,
}
