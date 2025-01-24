local M = {}

M.init = function()
  return {
    require('interface.theme').plugin,
    require('interface.alpha').plugin,
    require("interface.nvim-tree").plugin,
    require('interface.whichkey').plugin,
    require('interface.minimap').plugin,
    require('interface.telescope').plugin,
    require('interface.noice').plugin,
    require('interface.lualine').plugin,
    require('interface.treesitter').plugin,
    require('interface.trouble').plugin,
  }
end

return M
