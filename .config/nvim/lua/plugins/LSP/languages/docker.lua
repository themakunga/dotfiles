local ok = require("utils.check_requires").check({
  "lspconfig",
})

if not ok then
  return
end

local lspconfig = require("lspconfig")
local capabilities = require("plugins.LSP.capabilities")

lspconfig.dockerls.setup({
  capabilities = capabilities,
  settings = {
    docker = {
      languageserver = {
        formatter = {
          ignoreMultilineInstructions = true,
        },
      },
    },
  },
})

lspconfig.docker_compose_language_service.setup({})
