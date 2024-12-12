local ok = require("utils.check_requires").check({
  "lspconfig",
})

if not ok then
  return
end

local lspconfig = require("lspconfig")
local capabilities = require("plugins.LSP.capabilities")

lspconfig.terraform_lsp.setup({
  capabilities = capabilities,
  cmd = { "terraform-lsp" },
  filetypes = { "terraform", "hcl" },
})

lspconfig.terraformls.setup({
  capabilities = capabilities,
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars" },
})
