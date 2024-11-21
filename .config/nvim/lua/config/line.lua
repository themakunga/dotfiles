local M = {}

M.setup = function()
  vim.cmd("set relativenumber")
  vim.cmd("set number")
  vim.cmd("set nowrap")
  vim.cmd("set cursorline")

  vim.opt.list = true
  vim.opt.listchars = {
    tab = "→ ",
    lead = "·",
    trail = "·",
    eol = "↵",
  }

  local keymap = require("utils.keymap").keymap

  keymap("n", "<A-up>", ":move -2<cr>")
  keymap("v", "<A-k>", ":move -2<cr>")
  keymap("n", "<A-down>", ":move +1<cr>")
  keymap("v", "<A-j>", ":move +1<cr>")

  keymap("n", "<A-K>", ":copy .<cr>:move -2<cr>")
  keymap("n", "<A-J>", ":copy .<cr>")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
