local M = {}

M.plugin = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-go",
  },
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "neotest", "which-key", "neotest-go" })

  if not ok then
    return
  end

  local neotest = require("neotest")

  local adapters = {}

  local opts = {
    adapters = adapters,
  }

  neotest.setup(opts)

  local wk = vim.keymap.set

  wk("n", "<leader>tl", function()
    neotest.run.run_last()
  end, { desc = "Neotest Run last test" })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
