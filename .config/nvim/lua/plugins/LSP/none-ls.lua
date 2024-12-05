local M = {}

M.plugin = {
  "nvimtools/none-ls.nvim",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check_requires").check({ "null-ls" })
  if not ok then
    return
  end

  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
    },
  })

  local km = require("utils.keymap").keymap

  km("n", "<leader>gf", vim.lsp.buf.format, {})
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
