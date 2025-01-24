local M = {}

M.plugin = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    M.setup()
  end
}

M.setup = function()
  local ok = require("utils.check-requires").check({ "lspconfig" })

  if not ok then
    return
  end

  local lspconfig = require("lspconfig")

  local opts      = {}

  local servers   = require("plugins.LSP.common").mason_servers

  for _, server in pairs(servers) do
    opts = {
      on_attach = require("plugins.LSP.handlers").on_attach,
      capabilities = require("plugins.LSP.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "plugins.LSP.settings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server].setup(opts)
  end
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
