-- Look and feel
vim.opt.number = true         -- line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.signcolumn = "yes"    -- sign column always visible (LSP, git, etc)
vim.opt.cursorline = true     -- highlight current line
vim.opt.termguicolors = true  -- 24-bit colors
vim.opt.scrolloff = 8         -- linhas de contexto acima/abaixo do cursor
vim.opt.sidescrolloff = 8

-- Behaviour
vim.opt.mouse = "a"               -- mouse in all modes
vim.opt.clipboard = "unnamedplus" -- system clipboard
vim.opt.undofile = true           -- persistent undo between sessions
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.updatetime = 250 -- faster CursorHold (LSP hover, etc)
vim.opt.timeoutlen = 300 -- keymap sequences

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true -- case-sensitive if caps
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Splits
vim.opt.splitbelow = true -- horizontal split opens below
vim.opt.splitright = true -- vertical split opens right

-- Wrap
vim.opt.wrap = false -- no line wrap

-- Folding (LSP/treesitter)
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.opt.foldenable = false -- opening by default when opening a file

vim.opt.cmdheight = 0      -- hide the command line
