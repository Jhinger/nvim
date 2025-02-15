return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		{ "windwp/nvim-ts-autotag" },
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				"javascript",
				"typescript",
				"lua",
				"ruby",
				"svelte",
				"json",
				"sql",
				"tsx",
				"html",
				"css",
				"vim",
				"dockerfile",
				"gitignore",
				"yaml",
				"prisma",
				"jsdoc",
				"regex",
				"scss",
				"markdown",
				"markdown_inline",
				"bash",
			},
		})
	end,
}
