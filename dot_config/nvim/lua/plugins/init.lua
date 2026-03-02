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
  }
}
