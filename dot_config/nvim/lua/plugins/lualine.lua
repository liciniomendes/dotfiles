require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = true, -- unique status line for all buffers/windows
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { "dashboard", "snacks_dashboard" }, -- hide on dashboard
    },
    always_divide_middle = true,
    refresh = {
      statusline = 100,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
