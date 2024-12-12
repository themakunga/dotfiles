local ok = require("utils.check_requires").check({
  "lspconfig",
})

if not ok then
  return
end

local lspconfig = require("lspconfig")
local capabilities = require("plugins.LSP.capabilities")

lspconfig.gopls.setup({
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
})
