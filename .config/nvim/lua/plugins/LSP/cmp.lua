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
  },
  setup = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check_requires").check({"cmp", "luasnip", "lspkind", })

  if not ok then 
    return
  end

  local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      formatting = {
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
      },
    })

end

if not pcall(debug,getlocal, 4,1) then
  M.setup()
end

return M

