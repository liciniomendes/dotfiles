require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true, -- if no defined formatter uses lsp as fallback
  },
})
