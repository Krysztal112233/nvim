local M = {}

local function diagnostic_signs()
  if not vim.g.have_nerd_font then
    return {}
  end

  return {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  }
end

function M.config(virtual_lines)
  return {
    severity_sort = true,
    update_in_insert = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = vim.diagnostic.severity.ERROR },
    signs = diagnostic_signs(),
    virtual_lines = virtual_lines,
    virtual_text = {
      source = 'if_many',
      spacing = 2,
      format = function(diagnostic)
        return diagnostic.message
      end,
    },
  }
end

function M.setup()
  vim.diagnostic.config(M.config(false))
end

function M.toggle_virtual_lines()
  local enabled = vim.diagnostic.config().virtual_lines
  vim.diagnostic.config(M.config(not enabled))
end

return M
