-- lazydev.nvim: configures lua_ls workspace libraries for Neovim config editing.
-- Loads the vim runtime when `vim.` is used, plugin libraries for modules you
-- require(), plus the always-on libraries listed below (so ---@type annotations
-- like neotree.Config resolve in lazy specs that contain no require()).
return {
  'folke/lazydev.nvim',
  ft = 'lua',
  ---@module 'lazydev'
  ---@type lazydev.Config
  opts = {
    library = {
      'neo-tree.nvim', -- neotree.Config (used in profiles/default/neo-tree.lua)
      'blink.cmp', -- blink.cmp.Config (used in profiles/default/blink.lua)
    },
  },
}
