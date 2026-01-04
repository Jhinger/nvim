return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
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
			ensure_installed = {
				"docker_compose_language_service",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"gopls",
				"solargraph",
				"vue_ls", -- Vue
				"svelte",
				"marksman", -- Markdown
			},
			automatic_enable = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d",
				"rufo",
				"golangci-lint",
				-- "rubocop",
			},
		})
	end,
}
