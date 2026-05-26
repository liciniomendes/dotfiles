vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT", -- Neovim uses LuaJIT
      },
      workspace = {
        checkThirdParty = false,
        -- Makes lua_ls know nvim stdlib
        library = vim.list_extend(
          vim.api.nvim_get_runtime_file("", true),
          { vim.fn.stdpath("data") .. "/site/pack/core/opt" }
        ),
      },
      diagnostics = {
        globals = { "vim" }, -- now gloabal warnings of nvim
      },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.enable("lua_ls")
