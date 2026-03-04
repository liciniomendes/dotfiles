return {
  -- core
  { "nvim-lua/plenary.nvim" },

  -- Treesitter (syntax, indent)
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
  },

  -- Mason (lsp manager)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
    },
    opts = {
      ensure_installed = {
        "lua_ls",
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
  }
}
