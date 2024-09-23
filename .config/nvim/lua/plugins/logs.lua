return {
	"fei6409/log-highlight.nvim",
	config = function()
		require("log-highlight").setup({
			pattern = {
				".*%.log%..*",
				".*%.log%d+",
				".*%.log%d+%.?gz?",
			},
		})
	end,
}
