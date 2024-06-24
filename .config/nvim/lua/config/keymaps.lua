vim.g.mapleader = " "

local km = vim.keymap

km.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

km.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers in normal mode
km.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
km.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
km.set("n", "<leader>sv", "<C-w>v", { desc = "Split windows vertically" })
km.set("n", "<leader>sh", "<C-w>s", { desc = "Split windows horizontally" })
km.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
km.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current splitted window" })

-- tab management
km.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
km.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
km.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to nex tab" })
km.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previoud tab" })
km.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- lazy plugins
km.set("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Open Lazy UI" })

-- terminal
km.set("n", "<leader>te", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })
km.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Close Terminal" })

-- nvim-tree
km.set("n", "<leader>ee", "<cmd>NvimTreeFocus<CR>", { desc = "Toggle file explorer" })
km.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
km.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
km.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

-- telescope
km.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
km.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
km.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
km.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
km.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

-- lazygit
km.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })

-- autosession
km.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
km.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save current session of root dir" })

-- markdown preview
km.set("n", "<leader>fp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Preview of markdown file" })
