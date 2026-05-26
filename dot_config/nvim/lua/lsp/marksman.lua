vim.lsp.config("marksman", {
  cmd = { "marksman", "server" },
  filetypes = { "markdown" },
  root_markers = { ".git", ".marksman.toml" },
})

vim.lsp.enable("marksman")
