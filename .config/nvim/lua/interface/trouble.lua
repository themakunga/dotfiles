local M = {}

M.plugin = {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "trouble" })
  if not ok then
    return
  end

  local km = vim.keymap.set

  km("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { desc = "Open/close trouble list" })
  km("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Open trouble workspace diagnostics" })
  km("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Open trouble document diagnostics" })
  km("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Open trouble quickfix list" })
  km("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", { desc = "Open trouble location list" })
  km("n", "<leader>xt", "<cmd>TodoTrouble<CR>", { desc = "Open todos in trouble" })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
