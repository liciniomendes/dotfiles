local dap = require("dap")

-- DAP View UI
require("dap-view").setup({
  winbar = {
    show = true,
    sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl" },
    default_section = "scopes",
  },
  auto_toggle = true,
})

-- Virtual text
require("nvim-dap-virtual-text").setup({
  commented = true,
})

-- .NET / netcoredbg
-- We need this because there isn't a precompiled version for arm64 macbooks
-- we need to build it first and move it to the right place
-- and since we want this config to run in linux and osx we need a way
-- to identify where is running
local function get_netcoredbg()
  local mason_bin = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"
  if vim.fn.executable(mason_bin) == 1 then
    return mason_bin
  end
  return "netcoredbg"
end

dap.adapters.coreclr = {
  type = "executable",
  command = get_netcoredbg(),
  args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "Launch",
    request = "launch",
    justMyCode = false,
    program = function()
      local dlls = vim.fn.glob(vim.fn.getcwd() .. "/**/bin/Debug/**/*.dll", true, true)

      dlls = vim.tbl_filter(function(dll)
        return not dll:match("%.resources%.dll$")
            and not dll:match("ref/")
            and not dll:match("/runtimes/")
            and not dll:match("Microsoft%.")
            and not dll:match("System%.")
            and not dll:match("runtime")
      end, dlls)

      if #dlls == 0 then
        vim.notify("No .dll found. Run 'dotnet build' first.", vim.log.levels.WARN)
        return ""
      end

      if #dlls == 1 then
        return dlls[1]
      end

      local co = coroutine.running()
      vim.ui.select(dlls, { prompt = "Escolhe o dll:" }, function(choice)
        coroutine.resume(co, choice)
      end)
      return coroutine.yield()
    end,
  },
}

-- Keymaps
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Continue" })
vim.keymap.set("n", "<leader>do", function() dap.step_over() end, { desc = "Step over" })
vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step into" })
vim.keymap.set("n", "<leader>dO", function() dap.step_out() end, { desc = "Step out" })
vim.keymap.set("n", "<leader>dt", function() dap.terminate() end, { desc = "Terminate" })
vim.keymap.set("n", "<leader>dv", function() require("dap-view").toggle() end, { desc = "Toggle DAP view" })
