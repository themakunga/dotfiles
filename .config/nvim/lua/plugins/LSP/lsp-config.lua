local M = {}

M.plugin = {
  "neovim/nvim-lspconfig",
  {
    "nvimtools/none-ls.nvim",
  },
  config = function()
    M.setup()
  end,
}

M.setup = function()
  -- languages
  require("plugins.LSP.languages.lua")

  -- load keymaps
  require("plugins.LSP.utils.keymap")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
