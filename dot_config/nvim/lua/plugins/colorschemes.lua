return {
  { 'folke/tokyonight.nvim', lazy = true },
  { 'rebelot/kanagawa.nvim', lazy = true },
  { 'rose-pine/neovim', lazy = true },
  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('catppuccin-mocha')
    end,
    opts = {},
  },
  { 'ellisonleao/gruvbox.nvim', lazy = true },
  { 'sainnhe/everforest', lazy = true },
}
