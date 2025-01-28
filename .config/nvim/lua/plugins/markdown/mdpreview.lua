local M = {}

M.plugin = {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  setup = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "markdown-preview", "which-key" })
  if not ok then
    return
  end

  local wk = require("which-key")

  wk.add("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Preview of markdown file" })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
