local ok = require("utils.check_requires").check({ "lspconfig" })
if not ok then
  return
end

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({})
