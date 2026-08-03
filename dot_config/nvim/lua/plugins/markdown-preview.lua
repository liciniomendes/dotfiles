-- markdown-preview isn't lua plugin

vim.g.mkdp_filetypes = { "markdown" }
vim.g.mkdp_browser = "firefox"

vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Markdown Preview"})

-- creates command `MarkdownPreviewBuild` that needs to be run before
-- the first use. It basically installs what is needed for MDP work.
vim.api.nvim_create_user_command("MarkdownPreviewBuild", function()
  vim.system(
    { "yarn", "install" },
    { cwd = vim.fn.stdpath("data") .. "/site/pack/core/opt/markdown-preview.nvim/app" }
  )
end, {})
