local M = {}

M.plugin = {
  "akinsho/toggleterm.nvim",
  branch = "main",
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check_requires").check({ "toggleterm" })
  if not ok then
    return
  end

  local toggleterm = require("toggleterm")

  toggleterm.setup({
    direction = "float",
    close_on_exit = false,
    persist_mode = true,
    float_opts = {
      border = "curved",
    },
  })

  local km = require("utils.keymap").keymap
  local opts = { desc = "Toggle Terminal" }

  km("n", "<A-t>", ":ToggleTerm direction=float<CR>", opts)
  km("t", "<A-t>", "<C-\\><C-n> :ToggleTerm<CR>", opts)
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
