return {
  'echasnovski/mini.pairs',
  event = 'InsertEnter',
  opts = {
    modes = { insert = true, command = false, terminal = false },
    mappings = {
      ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
      ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
      ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },
      [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
      [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
      ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
      ['"'] = {
        action = 'closeopen',
        pair = '""',
        neigh_pattern = '[^\\].',
        register = { cr = false },
      },
      ["'"] = {
        action = 'closeopen',
        pair = "''",
        neigh_pattern = '[^%a\\].',
        register = { cr = false },
      },
      ['`'] = {
        action = 'closeopen',
        pair = '``',
        neigh_pattern = '[^\\].',
        register = { cr = false },
      },
    },
  },
  config = function(_, opts)
    require('mini.pairs').setup(opts)

    -- we need to rebind the key because of blink
    -- https://github.com/Saghen/blink.cmp/issues/909
    vim.keymap.set('i', '<C-l>', function()
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      local line = vim.api.nvim_get_current_line()
      local next_char = line:sub(col + 1, col + 1)
      if next_char:match('[%)%]%}"\'`]') then
        vim.api.nvim_win_set_cursor(0, { row, col + 1 })
      end
    end, { desc = 'Jump out of pair' })
  end,
}
