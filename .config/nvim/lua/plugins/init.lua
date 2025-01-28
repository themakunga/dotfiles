local M = {}

M.init = function()
  return {
    require("plugins.git.gitsigns").plugin,
    require("plugins.git.lazygit").plugin,
    require("plugins.helpers.autosession").plugin,
    require("plugins.helpers.comments").plugin,
    require("plugins.helpers.logs").plugin,
    require("plugins.helpers.sorter").plugin,
    require("plugins.helpers.todocomments").plugin,
    require("plugins.LSP.cmp").plugin,
    require("plugins.LSP.none-ls").plugin,
    require("plugins.LSP.mason").plugin,
    require("plugins.LSP.lspconfig").plugin,
    require("plugins.LSP.conform").plugin,
    require("plugins.autopairs").plugin,
    require("plugins.terminal.toggleterm").plugin,
    require("plugins.project.project").plugin,
    require("plugins.markdown.markview").plugin,
    require("plugins.markdown.mdpreview").plugin,
    require("plugins.markdown.mdsectionnumber").plugin,
    require("plugins.markdown.mdtoc").plugin,
    require("plugins.obsidian.obsidian").plugin,
  }
end

return M
