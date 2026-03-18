return {
  'mistricky/codesnap.nvim',
  cmd = { 'CodeSnap', 'CodeSnapSave' },
  opts = {
    watermark = {
      content = '',
    },
  },
  keys = {
    {
      '<leader>cs',
      '<cmd>CodeSnap<cr>',
      mode = 'v',
      desc = 'Screenshot to clipboard',
    },
    {
      '<leader>cS',
      '<cmd>CodeSnapSave<cr>',
      mode = 'v',
      desc = 'Screenshot to file',
    },
  },
}
