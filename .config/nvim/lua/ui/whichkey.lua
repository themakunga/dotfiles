local M = {}

M.plugin = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  setup = function()
    M.setup()
  end
}

M.setup = function()
  local ok = require("utils.check_requires").check({"which-key",})
  if not ok then
    return
  end

  local whichkey = require("which-key")

  local km = require("utils.keymap").keymap

  km("n", "<leader>?", whichkey.show({ global = false }), { desc = "Buffer Local Keymaps (which-key)"})
end

if not pcall(debug.getlocal, 4,1) then
  M.setup()
end

return M
