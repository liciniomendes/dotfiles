require("kulala").setup({
  default_env = "dev",
  debug = 3,
  display_mode = "split", -- side-by-side
  split_direction = "vertical",
})

-- Keymaps (only works on .http files)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "http",
  callback = function()
    local opts = { buffer = true }
    vim.keymap.set("n", "<leader>rs", function() require("kulala").run() end,
      vim.tbl_extend("force", opts, { desc = "Run request" }))
    vim.keymap.set("n", "<leader>ra", function() require("kulala").run_all() end,
      vim.tbl_extend("force", opts, { desc = "Run all requests" }))
    vim.keymap.set("n", "<leader>rn", function() require("kulala").jump_next() end,
      vim.tbl_extend("force", opts, { desc = "Next request" }))
    vim.keymap.set("n", "<leader>rp", function() require("kulala").jump_prev() end,
      vim.tbl_extend("force", opts, { desc = "Previous request" }))
    vim.keymap.set("n", "<leader>rc", function() require("kulala").copy() end,
      vim.tbl_extend("force", opts, { desc = "Copy as curl" }))
  end,
})
