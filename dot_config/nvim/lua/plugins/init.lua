vim.pack.add({
  -- Mason (lsp manager)
  { src = "https://github.com/williamboman/mason.nvim" },
  -- LSP
  { src = "https://github.com/seblyng/roslyn.nvim" },

  -- Treesitter (treesitter manager)
  { src = "https://github.com/romus204/tree-sitter-manager.nvim" },

  -- DAP
  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/igorlfs/nvim-dap-view",                    version = "v1.1.1" },
  { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },

  -- completions
  { src = "https://github.com/saghen/blink.cmp",                         version = "v1.10.2" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/echasnovski/mini.pairs" },

  -- appearance
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/echasnovski/mini.icons" },
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },

  -- coloschemes
  { src = "https://github.com/catppuccin/nvim" },

  -- indent
  { src = "https://github.com/stevearc/conform.nvim" },

  -- markdown
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },

  -- REST
  { src = "https://github.com/mistweaverco/kulala.nvim" },
})

-- loads all plugins exist in plugins folder
-- if order is needed will prefix the files with a order
local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"

for name, type in vim.fs.dir(plugins_dir) do
  if type == "file" and name ~= "init.lua" and name:match("%.lua$") then
    local plugin = name:gsub("%.lua$", "")
    require("plugins." .. plugin)
  end
end
