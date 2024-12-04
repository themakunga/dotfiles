local M = {}

M.plugin = {
  "nvim-telescope/telescope-ui-select.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check_requires").check({ "telescope" })

  if not ok then
    return
  end

  local telescope = require("telescope")

  telescope.setup({
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
      },
    },
  })

  telescope.load_extension("ui-select")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
