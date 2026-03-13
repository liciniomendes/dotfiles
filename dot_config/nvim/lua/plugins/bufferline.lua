return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',

  opts = {
    options = {
      show_buffer_close_icons = true,
      show_close_icon = true,
      modified_icon = '●',
      always_show_bufferline = true,

      diagnostics = 'nvim_lsp',
      -- indicator = { style = 'icon', icon = '▎' },
      separator_style = 'slant', -- or "thin"
    },
  },

  init = function()
    vim.o.showtabline = 2
  end,
}
