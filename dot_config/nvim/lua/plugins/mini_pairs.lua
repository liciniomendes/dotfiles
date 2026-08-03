require("mini.pairs").setup()

-- jump out of pairs with <C-l>
vim.keymap.set("i", "<C-l>", function()
  local closers = { ")", "]", "}", '"', "'", "`" }
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  for _, closer in ipairs(closers) do
    if line:sub(col + 1, col + 1) == closer then
      vim.api.nvim_win_set_cursor(0, { vim.fn.line("."), col + 1 })
      return
    end
  end
end, { desc = "Jump out of pair" })
