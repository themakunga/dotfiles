local M = {}

M.plugin = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
  M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check_requires").check({"mason", "mason-lspconfig", "mason-tool-installer", })
  if not ok then
    return
  end

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")


mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })


mason_lspconfig.setup({
  ensure_installed = {
        "ansiblels",
        "bashls",
        "cssls",
        "diagnosticls",
        "dockerls",
        "docker_compose_language_service",
        "dotls",
        "eslint",
        "emmet_ls",
        "glint",
        "gopls",
        "graphql",
        "groovyls",
        "html",
        "eslint",
        "tsp_server",
        "jqls",
        "lua_ls",
        "markdown_oxide",
        "spectral",
        "prismals",
        "puppet",
        "pylsp",
        "rust_analyzer",
        "sqlls",
        "somesass_ls",
        "taplo",
        "tailwindcss",
        "terraformls",
        "tflint",
        "vuels",
        "yamlls",
      },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- js linter
  },
})

end

if not pcall(debug.getlocal, 4,1) then
  M.setup()
end

return M
