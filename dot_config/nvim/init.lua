-- needs to be declared before any plugins
vim.g.mapleader = " " -- mapleader to <space>
vim.g.maplocalleader = " "

-- plugins in first place to ensure the colorscheme runs before everything else
require("plugins")
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("lsp")
