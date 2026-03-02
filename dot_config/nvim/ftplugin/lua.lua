require("nvim-treesitter").install({ "lua" }):wait(300000)

vim.treesitter.start()

vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- vim.wo[0][0].foldmethod = 'expr'

vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true

vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
