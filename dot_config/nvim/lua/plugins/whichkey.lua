require("which-key").setup({
  preset = "modern",
  delay = 300, -- ms before appear
  icons = {
    mappings = true,
  },
  spec = {
    -- keymap groups
    { "<leader>c", group = "Code" },
    { "<leader>d", group = "Diagnostics" },
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Git" },
    { "<leader>b", group = "Buffer" },
    { "<leader>t", group = "Terminal" },
    { "<leader>d", group = "Debug/Diagnostics" },
    { "g",         group = "Go to" },
    { "[",         group = "Previous" },
    { "]",         group = "Next" },
  },
})
