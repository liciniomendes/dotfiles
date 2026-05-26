require("blink.cmp").setup({
  keymap = {
    preset = "super-tab",
    --   ["<Tab>"] = { "accept", "fallback" },
    --   ["<C-space>"] = { "show", "fallback" },
    -- },
    -- cmdline = {
    --   keymap = {
    --     ["<Tab>"] = { "accept", "show", "fallback" },
    --     ["<S-Tab>"] = { "select_prev", "fallback" },
    --   },
  },
  completion = {
    ghost_text = { enabled = true },
    list = {
      selection = {
        preselect = true,
        auto_insert = false,
      },
    },
    menu = {
      border = "rounded",
      draw = {
        treesitter = { "lsp" },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = { border = "rounded" },
    },
  },
  signature = {
    enabled = true,
    window = { border = "rounded" },
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  sources = {
    default = { "lsp", "snippets", "path", "buffer", "render-markdown" },
    providers = {
      ["render-markdown"] = {
        name = "RenderMarkdown",
        module = "render-markdown.integ.blink",
        fallbacks = { "lsp" },
      },
    },
  },
  snippets = {
    preset = "default", -- uses native vim.snippet
  },
  fuzzy = {
    implementation = "lua",
    -- implementation = "prefer_rust_with_warning",
  },
})
