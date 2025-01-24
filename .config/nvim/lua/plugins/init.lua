local M = {}

M.init = function()
  return {
    require('plugins.git.gitsigns').plugin,
    require('plugins.git.lazygit').plugin,
    require('plugins.LSP.cmp').plugin,
    require('plugins.LSP.none-ls').plugin,
    require('plugins.LSP.mason').plugin,
    require('plugins.LSP.lspconfig').plugin,
  }
end

return M
