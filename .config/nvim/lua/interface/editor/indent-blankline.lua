local M = {}

M.plugin = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "ibl" })
  if not ok then
    return
  end

  local ibl = require("ibl")

  vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
  vim.g.indent_blankline_filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
  }
  vim.g.indentLine_enabled = 1
  -- vim.g.indent_blankline_char = "│"
  vim.g.indent_blankline_char = "▏"
  -- vim.g.indent_blankline_char = "▎"
  vim.g.indent_blankline_show_trailing_blankline_indent = false
  vim.g.indent_blankline_show_first_indent_level = true
  vim.g.indent_blankline_use_treesitter = true
  vim.g.indent_blankline_show_current_context = true
  vim.g.indent_blankline_context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type",
  }
  -- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
  vim.wo.colorcolumn = "99999"

  local opts = {
    scope = {
      enabled = true,
    },
  }

  ibl.setup(opts)
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
