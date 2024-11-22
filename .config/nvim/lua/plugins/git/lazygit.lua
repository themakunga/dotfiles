local M = {}

M.plugin = {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check_requires").check({ "lazygit", "telescope", })
  if not ok then
    return
  end
  local lazygit = require("lazygit")
  local telescope = require("telescope")

  telescope.load_extension("lazygit")

  lazygit.setup()
  
  local km = require("utils.keymap").keymap

  km("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M

