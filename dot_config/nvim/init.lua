-- Vim global configurations
vim.g.mapleader = ' '

-- Bootstrap lazy.nvim (once)
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from lua/plugins/*.lua
require('lazy').setup('plugins')

-- Sensible basics
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.termguicolors = true

-- fold configurations
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- use LSP if available, treesitter has fallback
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.lsp.foldexpr()'

-- lsp configs
vim.lsp.enable({ 'lua_ls', 'roslyn' })

-- automatically attachs the lsp
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    --    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    --    if client:supports_method('textDocument/completion') then
    --      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    --    end

    local map = function(mode, lhs, rhs, opts)
      opts = opts or {}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Actions
    map(
      'n',
      '<leader>ca',
      vim.lsp.buf.code_action,
      { desc = 'LSP Code Action' }
    )
    map(
      'v',
      '<leader>ca',
      vim.lsp.buf.code_action,
      { desc = 'LSP Code Action (Visual)' }
    )
    map('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'LSP Rename' })
    map('n', '<leader>cf', function()
      vim.lsp.buf.format({ async = true })
    end, { desc = 'LSP Format' })

    -- Navigation
    map('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP Go to definition' })
    map('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP Go to declaration' })
    map(
      'n',
      'gt',
      vim.lsp.buf.type_definition,
      { desc = 'LSP Go to type definition' }
    )
    map(
      'n',
      'gi',
      vim.lsp.buf.implementation,
      { desc = 'LSP Go to implementation' }
    )
    map('n', 'gr', vim.lsp.buf.references, { desc = 'LSP show references' })

    -- Hover
    map(
      'n',
      '<C-k>',
      vim.lsp.buf.signature_help,
      { desc = 'LSP Signature help' }
    )
  end,
})

-- configure the completion box
vim.cmd('set completeopt+=menu,menuone,noinsert')
vim.o.winborder = 'rounded'

-- enable lsp diagnostics below the line
vim.diagnostic.config({
  virtual_lines = { current_line = true },
})

-- initialize my lua/ setup
require('init')
