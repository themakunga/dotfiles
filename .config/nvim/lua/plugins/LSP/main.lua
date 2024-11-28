-- # LSP

local M = {}

M.plugin = {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- # LSP Hook
    {
      "nvimtools/none-ls.nvim",
      commit = "bb680d7",
      dependencies = {
        "nvim-lua/plenary.nvim",
       "nvimtools/none-ls-extras.nvim",
      },
    },
    -- # LSP Completion
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    -- # LSP Snippet
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    -- # LSP UI
      "nvimdev/lspsaga.nvim",
  },
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  -- # LSP utils
  require("plugins.LSP.utils.icon")
  require("plugins.LSP.utils.cmp")
  -- # LSP UI
  require("plugins.LSP.utils.lspsaga")
  -- # LSP Config
  require("plugins.LSP.languages.typescript")
  require("plugins.LSP.languages.css")
  require("plugins.LSP.languages.vue")
  require("plugins.LSP.languages.deno")
  require("plugins.LSP.languages.rust")
  require("plugins.LSP.languages.go")
  require("plugins.LSP.languages.cpp")
  require("plugins.LSP.languages.python")
  require("plugins.LSP.languages.lua")
  require("plugins.LSP.languages.php")
  -- format some markup and dif file
  require("plugins.LSP.languages.prettier")

  -- # LuaSnip
  require("plugins.LSP.luasnip.main")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
