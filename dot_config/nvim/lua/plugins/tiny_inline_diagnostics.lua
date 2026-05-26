require("tiny-inline-diagnostic").setup({
  preset = "modern", -- "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "among"
  options = {
    multilines = {
      enabled = true,
      always_show = false, -- only shows when in the line
    },
    overflow = {
      mode = "wrap", -- "wrap" to ensure the diagnostic is vsible
    },
    show_source = true,
    use_icons_from_diagnostic = true,
  },
})

-- ensures the native one is disable
vim.diagnostic.config({ virtual_text = false })
