local M = {}

M.plugin = {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "obsidian" })
  if not ok then
    return
  end

  local obsidian = require("obsidian")

  local opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
      {
        name = "work",
        path = "~/vaults/work",
      },
    },
  }

  obsidian.setup(opts)
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
