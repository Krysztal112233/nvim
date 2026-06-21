local M = {}

local function blink_capabilities()
  return require('blink.cmp').get_lsp_capabilities()
end

function M.capabilities(extra)
  return vim.tbl_deep_extend('force', {}, blink_capabilities(), extra or {})
end

function M.supports(client, method, bufnr)
  return client:supports_method(method, bufnr)
end

function M.setup()
  local servers = {
    bashls = {
      filetypes = { 'bash', 'sh', 'zsh' },
    },
    markdown_oxide = {},
    taplo = {},
    clangd = {},
    gleam = {},
    gopls = {},
    lua_ls = {
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          },
        },
      },
    },

    sqls = {
      settings = {
        sqls = {
          connections = {
            {
              driver = 'postgresql',
              dataSourceName = 'host=127.0.0.1 port=5432 user=postgres password=postgres dbname=postgres sslmode=disable',
            },
          },
        },
      },
    },

    denols = {},
    ts_ls = {
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
            languages = { 'vue' },
            configNamespace = 'typescript',
          },
        },
      },
      filetypes = { 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    },
    vue_ls = {},
  }

  for name, config in pairs(servers) do
    config.capabilities = M.capabilities(config.capabilities)
    vim.lsp.config(name, config)
  end

  vim.lsp.enable(vim.tbl_filter(function(name)
    return name ~= 'denols'
  end, vim.tbl_keys(servers)))
end

function M.ensure_installed()
  return {
    'bash-language-server',
    'clangd',
    'deno',
    'gopls',
    'lua-language-server',
    'markdown-oxide',
    'sqls',
    'stylua',
    'taplo',
    'typescript-language-server',
    'vue-language-server',
  }
end

return M
