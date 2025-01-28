local M = {}

M.plugin = {
  "whitestarrain/md-section-number.nvim",
  ft = "markdown",
  setup = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "md-section-number", "which-key" })
  if not ok then
    return
  end

  local mdsectionnumber = require("md-section-number")
  local km = require("which-key")

  mdsectionnumber.setup({
    max_level = 5, -- stop to add section number after max_level
    min_level = 2, -- start to add section number after min_level
    ignore_pairs = { -- the markdown content in these pairs will be ignored
      { "```", "```" },
      { "\\~\\~\\~", "\\~\\~\\~" },
      { "<!--", "-->" },
    },
    toc = { -- toc sidebar config
      width = 30,
      position = "right",
      indent_space_number = 2,
      header_prefix = "- ",
    },
  })

  km.add("n", "<leader>mdc", "<cmd>MdClearNumber<cr>", { desc = "Delete all the header level numbers." })
  km.add("n", "<leader>mdu", "<cmd>MdUpdateNumber<cr>", { desc = "Add or update all the header level numbers." })
  km.add("n", "<leader>md-", "<cmd>MdHeaderDecrease<cr>", { desc = "Decrease a header level." })
  km.add("n", "<leader>md+", "<cmd>MdHeaderIncrease<cr>", { desc = "Increase a header level." })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
