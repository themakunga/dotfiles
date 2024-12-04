local M = {}

M.plugin = {
  "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  config = function ()
    M.setup()
  end,
}

M.setup = function ()
  local ok = require("utils.check_requires").check({"lint",})
  if not ok then
    return
  end

  local lint = require("lint")

  lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        vue = { "eslint_d"},
        terraform = { "tflint" },
        ruby = { "standardrb" },
        bash = {"bash"},
        commitlint = {"commitlint"},
        cpp = {"cpplint"},
        go = {"golangcilint"},
        json = {"jsonlint"},
        lua = {"luacheck"},
        prisma = {"prisma-lint"},
        python = {"pylint"},
        swift = {"swiftlint"},
        yaml = {"yamllint"},
        zsh = {
      "zsh"
    },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })


  local keymap = require("utils.keymap").keymap

  keymap("n", "<leader>ll", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" }) 
end


if not pcall(debug.getlocal, 4,1) then
  M.setup()
end

return M
