return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },

  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },

    nesting_rules = {
      ['package.json'] = {
        pattern = '^package%.json$', -- <-- Lua pattern
        files = { 'package-lock.json', 'yarn*' }, -- <-- glob pattern
      },
      ['go'] = {
        pattern = '(.*)%.go$', -- <-- Lua pattern with capture
        files = { '%1_test.go' }, -- <-- glob pattern with capture
      },
      ['js-extended'] = {
        pattern = '(.+)%.js$',
        files = { '%1.js.map', '%1.min.js', '%1.d.ts' },
      },
      ['docker'] = {
        pattern = '^dockerfile$',
        ignore_case = true,
        files = { '.dockerignore', 'docker-compose.*', 'dockerfile*' },
      },
      ['service'] = {
        pattern = '(.*)%.service$',
        files = { '%1.timer', '%1.env' },
      },
      ['Cargo.toml'] = {
        files = {
          '%.clippy%.toml',
          '%.rustfmt%.toml',
          'Cargo%.Bazel%.lock',
          'Cargo%.lock',
          'clippy%.toml',
          'cross%.toml',
          'insta%.yaml',
          'rust-toolchain%.toml',
          'rustfmt%.toml',
        },
        pattern = 'Cargo%.toml$',
      },
    },
  },
}
