local M = {}

M.setup = function()

  local global = vim.g
  local opt = vim.opt
  local o = vim.o

  global.mapleader = " "
  opt.ignorecase = true -- ignore case in search
opt.smartcase = true -- if detect mixed case be case-sensitive

opt.termguicolors = true
opt.background = "dark" -- for default scheme
opt.signcolumn = "yes" -- prevent shift of text showin the sign column
-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or start position in insertmode

--clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard

--split windows
opt.splitright = true -- vertical split to right
opt.splitbelow = true -- horizontal split down or bottom

opt.swapfile = false
opt.syntax = "on"
opt.encoding = "UTF-8"
opt.title = true
opt.hidden = true
opt.ttimeoutlen = 0
opt.wildmenu = true
opt.showcmd = true
opt.showmatch = true
opt.inccommand = "split"
opt.ruler = true

o.autoread = true
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
