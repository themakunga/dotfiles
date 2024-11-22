local M = {}

M.plugin = {
  'trevorhauter/gitportal.nvim',
  setup = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check_requires").check({"gitportal",})
  if not ok then 
    return
  end

  local gitportal = require("gitportal")

gitportal.setup({
  always_include_current_line = true
})

  local km = require("utils.keymap").keymap

  km({"n", "v"}, "<leader>gp", function() gitportal.open_file_in_browser() end, { desc = "GitPortal open in browser"})
end

if not pcall(debug.getlocal, 4,1) then
  M.setup()
end

return M
