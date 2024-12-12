local M = {}
M.plugin = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    vim.opt.signcolumn = "yes"
  end,
  config = function()
    M.config()
  end,
}

M.config = function()
  local ok = require("utils.check_requires").check({
    "lspconfig",
    "mason-lspconfig",
  })

  if not ok then
    return
  end

  local mason_lspconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")
  local lsp_defaults = require("lspconfig").util.default_config

  lsp_defaults.capabilities =
    vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

  -- LspAttach is where you enable features that only work
  -- if there is a language server active in the file
  vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
      local opts = { buffer = event.buf }

      vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
      vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
      vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
      vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
      vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
      vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
      vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
      vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
      vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    end,
  })

  require("plugins.LSP.languages")

  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "✘",
        [vim.diagnostic.severity.WARN] = "▲",
        [vim.diagnostic.severity.HINT] = "⚑",
        [vim.diagnostic.severity.INFO] = "»",
      },
    },
  })

  local buffer_autoformat = function(bufnr)
    local group = "lsp_autoformat"
    vim.api.nvim_create_augroup(group, { clear = false })
    vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      group = group,
      desc = "LSP format on save",
      callback = function()
        -- note: do not enable async formatting
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
      end,
    })
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
      local id = vim.tbl_get(event, "data", "client_id")
      local client = id and vim.lsp.get_client_by_id(id)
      if client == nil then
        return
      end

      -- make sure there is at least one client with formatting capabilities
      if client.supports_method("textDocument/formatting") then
        buffer_autoformat(event.buf)
      end
    end,
  })

  local capabilities = require("plugins.LSP.capabilities")

  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
      })
    end,
  })
end

if not pcall(debug.getlocal, 4, 1) then
  M.config()
end

return M
