return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ansiblels",
				"bashls",
				"cssls",
				"diagnosticls",
				"dockerls",
				"docker_compose_language_service",
				"dotls",
				"eslint",
				"emmet_ls",
				"glint",
				"gopls",
				"graphql",
				"groovyls",
				"html",
				"ts_ls",
				"jqls",
				"lua_ls",
				"markdown_oxide",
				"spectral",
				"prismals",
				"puppet",
				"pylsp",
				"rust_analyzer",
				"sqlls",
				"somesass_ls",
				"taplo",
				"tailwindcss",
				"terraformls",
				"tflint",
				"vuels",
				"yamlls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
			},
		})
	end,
}
