local M = {}

M.plugin = {
  "folke/lazydev.nvim",
  ft = "lua",
  dependencies = {
    { "gonstoll/wezterm-types", lazy = true },
    { "Bilal2453/luvit-meta", lazy = true },
  },
  setup = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check_requires").check({"lazydev",})
  if not ok then
    return 
  end

  local lazydev = require("lazydev")

  lazydev.setup({
    library = {
      { path = "luvit-meta/library", words = { "vim%.uv" } },
      { path = "wezterm-types", mods = { "wezterm" } },
    },
  })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
