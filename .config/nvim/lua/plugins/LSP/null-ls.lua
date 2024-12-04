local M = {}

M.plugin = {}

M.setup = function() end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
