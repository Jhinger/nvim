return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"vue-language-server",
				"vtsls",
				"helm-ls",
				"prettier",
				"stylua",
				"eslint_d",
				"yaml-language-server",
				"rufo",
				"golangci-lint",
				"tflint",
				"tfsec",
				"ruby-lsp",
			},
		})
	end,
}
