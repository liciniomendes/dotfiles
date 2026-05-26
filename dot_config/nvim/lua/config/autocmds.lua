-- Treesitter highlighting, adds the parsers as needed
vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})

-- need to register parser for csharp since treesitter expects c_sharp
-- but the filetype is cs
vim.treesitter.language.register("c_sharp", "cs")

-- configure lsp keys only when a lsp is active in the buffer
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = function(desc)
      return { buffer = ev.buf, desc = desc }
    end

    -- Navigation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Go to references"))
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts("Go to type definition"))

    -- Information
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover documentation"))
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts("Signature help"))

    -- Code
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts("Rename symbol"))
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
    vim.keymap.set("n", "<leader>cf", function()
      require("conform").format({ async = false, lsp_fallback = true })
    end, { desc = "Format buffer" })

    -- Diagnostics
    vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts("Open diagnostic float"))
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts("Previous diagnostic"))
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts("Next diagnostic"))
    vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, opts("Diagnostics to loclist"))
  end,
})
