return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  opts = {
    sections = {
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
    },
  },
}
