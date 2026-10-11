return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- use latest release, remove to use latest commit
  ft = 'markdown',
  lazy = false,
  cond = function()
    return vim.fn.isdirectory(vim.fn.expand '~/Documents/Obsidian Vault') == 1
  end,
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = 'Default',
        path = '~/Documents/Obsidian Vault',
        overrides = {
          templates = { folder = '模板' },
          daily_notes = {
            folder = '日记',
            template = '~/Documents/Obsidian Vault/模板/日记模板',
            default_tags = {},
          },
        },
      },
    },
  },
}
