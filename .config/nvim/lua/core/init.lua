local M = {}

M.init = function()
    require('core.options').setup()
    require('core.keymaps').setup()
end

if not pcall(debug.getlocal, 4, 1) then
    M.init()
end

return M
