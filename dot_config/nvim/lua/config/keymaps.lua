--
-- My specific keymaps
--

local map = vim.keymap.set

-- Buffers
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })

-- Snacks
map('n', '<leader> ', function()
  Snacks.picker.files()
end)
map('n', '<leader>fg', function()
  Snacks.picker.grep()
end)
map('n', '<leader>fb', function()
  Snacks.picker.buffers()
end)
map('n', '<leader>fs', function()
  Snacks.picker.lsp_symbols()
end)
map('n', '<leader>fe', function()
  Snacks.explorer()
end)
map('n', '<leader>fE', function()
  Snacks.explorer({ cwd = vim.fn.expand('%:p:h') })
end)
map('n', '<leader>ff', function()
  Snacks.explorer({ follow_file = true })
end)
