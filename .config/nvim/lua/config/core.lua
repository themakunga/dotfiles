local opt = vim.opt

local global = vim.g

local o = vim.o

global.netrw_liststyle = 3

opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2 -- 2 spaces for tabs (soft tabs)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- convert tab to spaces
opt.autoindent = true -- copy indent from previous line

opt.wrap = true
vim.opt_local.wrap = true
opt.textwidth = 120
-- search settings
opt.ignorecase = true -- ignore case in search
opt.smartcase = true -- if detect mixed case be case-sensitive

opt.cursorline = true -- highlight current line

-- enable termguicolors remember use a true color terminal
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
opt.mouse = "a"
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
