return {
	"whitestarrain/md-section-number.nvim",
	ft = "markdown",
	config = function()
		require("md_section_number").setup({
			max_level = 5, -- stop to add section number after max_level
			min_level = 2, -- start to add section number after min_level
			ignore_pairs = { -- the markdown content in these pairs will be ignored
				{ "```", "```" },
				{ "\\~\\~\\~", "\\~\\~\\~" },
				{ "<!--", "-->" },
			},
			toc = { -- toc sidebar config
				width = 30,
				position = "right",
				indent_space_number = 2,
				header_prefix = "- ",
			},
		})
	end,
}
