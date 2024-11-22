local M = {}

M.plugin = {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    M.config()
  end,
}

M.config = function()
  local ok = require("utils.check_requires").check({"nvim-autopairs",})
  if not ok then
    return
  end

  local autopairs = require("nvim-autopairs")

  autopairs.setup({
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
        java = false, -- don't check treesitter on java
      },
    })

  local cmp_autopairs = require("nvim-autopairs.completion.cmp")

  local cmp = require("cmp")

    -- make autopairs and completion work together
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end


if not pcall(debug.getlocal, 4,1)then
  M.config()
end

return M