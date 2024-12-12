local ok = require("utils.check_requires").check({
  "lspconfig",
})

if not ok then
  return
end

local lspconfig = require("lspconfig")
local capabilities = require("plugins.LSP.capabilities")

lspconfig.pylsp.setup({
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "W391" },
          maxLineLength = 100,
        },
      },
    },
  },
  cmd = { "pylsp" },
  filetypes = { "python" },
})
