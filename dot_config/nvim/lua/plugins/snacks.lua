require("snacks").setup({
  picker = {
    enabled = true,
    exclude = {
      "*.excalidraw",
      "*.svg",
    },
  },
  notifier = { enabled = true },
  terminal = { enabled = true },
  gitbrowse = { enabled = true },
  git = { enabled = true },
  bufdelete = { enabled = true },
  indent = { enabled = true },
  words = { enabled = true },
  statuscolumn = { enabled = true },
  scroll = { enabled = true },
  explorer = { enabled = true },
  dashboard = {
    enabled = false,
    sections = {
      { section = "header" },
      { section = "keys",         gap = 1 },
      { section = "recent_files", limit = 5, padding = 1 },
    },
  },
})

-- File picker
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader> ", function() Snacks.picker.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent files" })
vim.keymap.set("n", "<leader>fs", function() Snacks.picker.lsp_symbols() end, { desc = "LSP symbols" })
vim.keymap.set("n", "<leader>fe", function() Snacks.picker.explorer() end, { desc = "Explorer" })

-- Git
vim.keymap.set("n", "<leader>gb", function() Snacks.git.blame_line() end, { desc = "Git blame line" })
vim.keymap.set("n", "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git browse" })
vim.keymap.set("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git diff"})

-- Terminal
vim.keymap.set("n", "<leader>t", function() Snacks.terminal() end, { desc = "Terminal" })

-- Buffers
vim.keymap.set("n", "<leader>fb", function()
  Snacks.picker.buffers({ current = false, sort_lastused = true })
end, { desc = "Open buffers" })
vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete buffer" })
