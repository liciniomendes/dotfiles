return {
  'chrisgrieser/nvim-origami',
  event = 'BufReadPost',
  opts = {
    autoFold = {
      enabled = false,
      kinds = { 'imports', 'comment' },
    },
  },
}
