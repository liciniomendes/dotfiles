return {
  'danymat/neogen',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    snippet_engine = 'nvim', -- usa o snippet engine nativo do nvim 0.11
    languages = {
      cs = {
        template = {
          annotation_convention = 'xmldoc',
        },
      },
    },
  },
  keys = {
    {
      '<leader>cd',
      function()
        require('neogen').generate()
      end,
      desc = 'Generate XML doc comment',
    },
  },
}
