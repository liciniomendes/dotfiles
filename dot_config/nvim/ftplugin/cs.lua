require('nvim-treesitter').install({ 'c_sharp' }):wait(300000)

vim.treesitter.start()

vim.keymap.set('n', '///', function()
  require('neogen').generate()
end, { buffer = true, desc = 'Generate XML doc comment' })
