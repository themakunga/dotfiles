local ok = require("utils.check_requires").check({ "lspconfig", "null-ls" })
if not ok then
  return
end

local lspconfig = require("lspconfig")
local null_ls = require("null-ls")

lspconfig.lua_ls.setup({})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
  },
})
