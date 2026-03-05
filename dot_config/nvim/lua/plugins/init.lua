return {
  -- core
  { 'nvim-lua/plenary.nvim' },

  -- Treesitter (syntax, indent)
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
  },

  -- Mason (lsp manager)
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:mason-org/mason-registry',
            'github:Crashdummyy/mason-registry',
          },
        },
        config = function(_, opts)
          require('mason').setup(opts)

          local registry = require('mason-registry')
          registry.refresh(function()
            local pkg = registry.get_package('roslyn')
            if not pkg:is_installed() then
              pkg:install()
            end
          end)
        end,
      },
    },
    opts = {
      ensure_installed = {
        'lua_ls',
        'stylua',
      },
    },
  },

  -- Markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  -- Conform
  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = function(bufnr)
        return {
          timeout_ms = 3000,
          lsp_format = 'fallback',
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },

  -- Roslyn
  {
    'seblj/roslyn.nvim',
    ft = { 'cs' },
    opts = {},
  },
}
