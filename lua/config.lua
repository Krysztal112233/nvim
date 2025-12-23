local listchar = { tab = '» ', trail = '·', nbsp = '␣' }
return {
  listchar = {
    n = listchar,
    i = vim.tbl_deep_extend('force', listchar, { space = '·' }),
  },
}
