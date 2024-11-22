local M = {}

M.plugin = {
  "stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	setup = function()
	  M.setup()
  end,
}

M.setup = function()
  local ok = require("utils.check_requires").check({"conform",})
  if not ok then
    return
  end

  local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		  prettier = {
			config_command = "--config",
			config_names = {
				".prettierrc",
				".prettierrc.json",
				".prettierrc.yml",
				".prettierrc.yaml",
				".prettierrc.json5",
				".prettierrc.js",
				".editorconfig",
			},
			config_path = ".prettierrc.json",
		},
		})

  local km = require("utils.keymap").keymap

  km({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
end

if not pcall(debug.getlocal, 4,1) then
  M.setup()
end

return M
