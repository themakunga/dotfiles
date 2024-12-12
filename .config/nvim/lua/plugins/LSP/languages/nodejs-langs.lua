local ok = require("utils.check_requires").check({
  "lspconfig",
})

if not ok then
  return
end

local lspconfig = require("lspconfig")
local capabilities = require("plugins.LSP.capabilities")

lspconfig.ts_ls.setup({
  capabilities = capabilities,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
})

lspconfig.vuels.setup({})
