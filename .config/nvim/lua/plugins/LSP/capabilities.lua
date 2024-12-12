local ok = require("utils.check_requires").check({
  "cmp_nvim_lsp"
});

if not ok then
  return
end

local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_nvim_lsp.default_capabilities()

return capabilities
