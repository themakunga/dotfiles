local M = {}

M.plugin = {
  -- "editorconfig/editorconfig-vim",
  -- event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  require("config.core").setup()
  require("config.indent").setup()
  require("config.line").setup()
  -- require("config.window").setup()
  -- require("config.tab").setup()
  require("config.mouse").setup()
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
