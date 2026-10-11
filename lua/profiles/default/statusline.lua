local function macro_recording()
  local register = vim.fn.reg_recording()
  if register == '' then
    return ''
  end

  return ('REC @%s · completion paused'):format(register)
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  opts = {
    sections = {
      lualine_a = {
        'mode',
        {
          macro_recording,
          cond = function()
            return vim.fn.reg_recording() ~= ''
          end,
          color = { fg = '#ffffff', bg = '#e64553', gui = 'bold' },
        },
      },
      lualine_c = { 'lsp_status' },
      lualine_x = {
        'filetype',
        { 'fileformat', symbols = { unix = 'UNIX', dos = 'WINDOWS', mac = 'MAC' } },
        'encoding',
      },
      lualine_y = {
        'progress',
        'location',
      },
      lualine_z = {
        { 'datetime', style = 'default' },
      },
    },
    options = {
      theme = 'catppuccin-nvim',
      globalstatus = true,
      disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'ministarter', 'snacks_dashboard' } },
      extensions = { 'neo-tree' },
      refresh = {
        events = {
          'WinEnter',
          'BufEnter',
          'BufWritePost',
          'SessionLoadPost',
          'FileChangedShellPost',
          'VimResized',
          'Filetype',
          'CursorMoved',
          'CursorMovedI',
          'ModeChanged',
          'RecordingEnter',
          'RecordingLeave',
        },
      },
    },
  },
}
