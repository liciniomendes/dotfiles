return {
  'saghen/blink.cmp',
  version = '1.*',
  opts = {
    keymap = { preset = 'super-tab' },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      menu = {
        border = 'rounded',
        draw = {
          columns = {
            { 'label', 'label_description' },
            { 'kind_icon', 'kind' },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = 'rounded' },
        treesitter_highlighting = true,
      },
      ghost_text = { enabled = true },
      keyword = { fuzzy = true },
      accept = {
        auto_brackets = { enabled = true },
      },
    },
    fuzzy = {
      use_typo_resistance = false,
      frecency = { enabled = true },
      proximity = { enabled = true },
    },
    sources = {
      default = { 'lsp', 'path', 'buffer', 'snippets' },
    },
  },
}
