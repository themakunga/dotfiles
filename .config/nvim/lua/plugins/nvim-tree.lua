return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local ntree = require("nvim-tree")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		ntree.setup({
			update_cwd = true,
			hijack_cursor = true,
			view = {
				width = 35,
				relativenumber = false,
				side = "left",
			},

			renderer = {
				highlight_git = true,
				root_folder_modifier = ":t",
				indent_markers = {

					enable = true,
				},
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "◉",
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "",
							deleted = "",
							untracked = "",
							ignored = "",
						},
						folder = {
							default = "",
							open = "",
							symlink = "",
						},
					},
					show = {
						git = false,
						file = true,
						folder = true,
						folder_arrow = false,
					},
				},
			},
			actions = {
				open_file = {
					resize_window = true,
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = {
					".DS_Store",
				},
			},
			git = {
				ignore = false,
			},
		})
	end,
	mappings = function()
		local api = require("nvim-tree.api")

		return {
			{},
		}
	end,
}
