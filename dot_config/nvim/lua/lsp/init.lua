-- load all files in 'lua/lsp' (except init.lua)
-- we don't have a roslyn_ls.lua because seblyn already does that by us
local lsp_dir = vim.fn.stdpath("config") .. "/lua/lsp"

for name, type in vim.fs.dir(lsp_dir) do
  if type == "file" and name ~= "init.lua" and name:match("%.lua$") then
    local server = name:gsub("%.lua$", "")
    require("lsp." .. server)
  end
end
