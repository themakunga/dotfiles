local M = {}

M.plugin = {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  setup = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "todo-comments", "which-key" })
  if not ok then
    return
  end

  local todocomment = require("todo-comments")

  local km = require("which-key")

  km.add("n", "]t", function()
    todocomment.jump_next()
  end, { desc = "Next todo comment" })
  km.add("n", "[t", function()
    todocomment.jump_prev()
  end, { desc = "Previous todo comment" })

  todocomment.setup()
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
