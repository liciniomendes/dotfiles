  -- Vim global configurations
  vim.g.mapleader = " "

  -- Bootstrap lazy.nvim (once)
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git","clone","--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", lazypath
    })
  end
  vim.opt.rtp:prepend(lazypath)

  -- Load plugins from lua/plugins/*.lua
  require("lazy").setup("plugins")

  -- Sensible basics
  vim.o.number = true
  vim.o.relativenumber = true
  vim.o.signcolumn = "yes"
  vim.o.termguicolors = true

  -- lsp configs
  vim.lsp.enable({ "lua_ls" })

  -- automatically attachs the lsp
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if client:supports_method("textDocument/completion") then
        vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      end
    end,
  })

  -- configure the completion box
  vim.cmd("set completeopt+=menu,menuone,noinsert")
  vim.o.winborder = "rounded"

  -- enable lsp diagnostics below the line
  vim.diagnostic.config({
    virtual_lines = { current_line = true }
})

-- initialize my lua/ setup
require("init")
