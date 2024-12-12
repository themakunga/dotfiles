local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local ok = require("utils.check_requires").check({ "lazy" })
if not ok then
  return
end

local lazy = require("lazy")

-- main configuration
require("config.main").setup()

lazy.setup({

  -- basic setup
  checker = {
    notify = false,
    enabled = true,
  },
  change_detection = {
    notify = false,
  },

  -- theme
  require("themes.tokyonight").plugin,

  -- ui
  require("ui.alpha").plugin,
  require("ui.noice").plugin,
  require("ui.lualine").plugin,
  require("ui.minimap").plugin,
  require("ui.whichkey").plugin,
  require("ui.aerial").plugin,

  -- telescope
  require("ui.telescope").plugin,

  -- helpers
  require("plugins.helpers.autosession").plugin,
  require("plugins.helpers.trouble").plugin,
  require("plugins.helpers.todocomments").plugin,
  require("plugins.helpers.logs").plugin,
  require("plugins.helpers.comment").plugin,
  require("plugins.helpers.sorter").plugin,

  -- buffer
  require("plugins.buffer.tabby").plugin,
  require("plugins.buffer.buffer_manager").plugin,

  -- nvim tree
  require("plugins.tree.nvim-tree").plugin,

  -- treesitteer
  require("plugins.parsers.treesitter").plugin,
  -- terminal
  require("plugins.terminal.toggleterm").plugin,
  require("plugins.terminal.lazydev").plugin,

  -- git
  require("plugins.git.gitsigns").plugin,
  require("plugins.git.lazygit").plugin,
  require("plugins.git.gitportal").plugin,

  -- markdown
  require("plugins.markdown.mdpreview").plugin,
  require("plugins.markdown.mdtoc").plugin,
  require("plugins.markdown.markview").plugin,
  require("plugins.markdown.mdsectionnumbers").plugin,
  --
  -- lsp
  require("plugins.LSP.cmp").plugin,
  require("plugins.LSP.lsp-config").plugin,
  require("plugins.LSP.conform").plugin,
  require("plugins.LSP.mason").plugin,
  require("plugins.LSP.autopairs").plugin,
  -- dap
  require("plugins.DAP.main").plugin,
})
