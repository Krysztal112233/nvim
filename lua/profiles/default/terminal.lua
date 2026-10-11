return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup()

    vim.keymap.set('n', '<C-`>', '<Cmd>ToggleTerm<CR>')
    vim.keymap.set('t', '<C-`>', [[<C-\><C-n><Cmd>ToggleTerm<CR>]])
  end,
}
