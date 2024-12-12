local M = {}

M.plugin = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
    "brenoprata10/nvim-highlight-colors",
  },
  config = function()
    M.config()
  end,
}

M.config = function()
  local ok = require("utils.check_requires").check({
    "cmp",
    "luasnip",
    "lspkind",
  })

  if not ok then
    return
  end

  local cmp = require("cmp")
  local lspkind = require("lspkind")
  local luasnip = require("luasnip")

  local sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }

  local snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  }

  local completion = {
    completeopt = "menu,menuone,preview,noselect",
  }

  local window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }

  local formatting = {
    -- changing the order of fields so the icon is the first
    fields = { "menu", "abbr", "kind" },

    -- here is where the change happens
    format = function(entry, item)
      local color_item = require("nvim-highlight-colors").format(entry, {
        item = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        })(entry, item),
      })
      if color_item.abbr_hl_group then
        item.kind_hl_group = color_item.abbr_hl_group
        item.kind = color_item.abbr
      end
      return item
    end,
  }

  local mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  })

  local opts = {
    preselect = "item",
    completion = completion,
    sources = sources,
    snippet = snippet,
    mapping = mapping,
    window = window,
    formatting = formatting,
  }
  require("luasnip.loaders.from_vscode").lazy_load()
  cmp.setup(opts)
end

if not pcall(debug.getlocal, 4, 1) then
  M.config()
end

return M
