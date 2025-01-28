local M = {}

M.plugin = {
  "hedyhli/markdown-toc.nvim",
  ft = "markdown", -- Lazy load on markdown filetype
  cmd = { "Mtoc" }, -- Or, lazy load on "Mtoc" command
  opts = {
    -- Your configuration here (optional)
  },
  setup = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "mtoc", "which-key" })
  if not ok then
    return
  end

  local mtoc = require("mtoc")
  local km = require("which-key")

  mtoc.setup({ headings = {
    pattern = "^(##+)%s+(.+)$",
  } })

  km.add("n", "<leader>mti", "<cmd>Mtoc insert<cr>", { desc = "Markdown TOC insert on cursor position" })
  km.add("n", "<leader>mtu", "<cmd>Mtoc update<cr>", { desc = "Markdown TOC update" })
  km.add("n", "<leader>mtr", "<cmd>Mtoc remove<cr>", { desc = "Markdown TOC remove" })
  km.add("n", "<leader>mdt", "<cmd>MdTocToggle<cr>", { desc = "View the table of contents." })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
