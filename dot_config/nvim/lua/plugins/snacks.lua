return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    indent = {
      enabled = true,
      char = '▏', -- '│' or "▏" for lighter option
      hl = 'SnacksIndent',
    },
    explorer = {
      replace_netrw = true,
      enabled = true,
      -- Auto-jump to current file
      follow_file = false,
      -- Show dotfiles
      hidden = true,
      -- Show git changes in tree
      git_status = true,
      -- Show untracked git files
      git_untracked = true,
      -- Show LSP diagnostics in the tree
      diagnostics = true,
      -- Enable fs watching (off by default)
      watch = false,
    },
    picker = {
      enabled = true,
      -- This enables the picker show dotfiles by default
      hidden = true,
    },
  },
}
