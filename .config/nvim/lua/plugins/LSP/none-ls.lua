local M = {}

M.plugin = {
  "nvimtools/none-ls.nvim",
  config = function()
    M.setup()
  end
}

M.setup = function()
  local ok = require('utils.check-requires').check({ 'null-ls' })

  if not ok then
    return
  end

  local null_ls         = require("null-ls")

  local formatting      = null_ls.builtins.formatting
  local diagnostics     = null_ls.builtins.diagnostics
  local completion      = null_ls.builtins.completion

  local null_ls_options = {
    sources = {
      debug = false,
      formatting.stylua,

    }
  }


  null_ls.setup(null_ls_options)
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
