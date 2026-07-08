return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			svelte = { "prettier" },
			ruby = { "rufo" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			lua = { "stylua" },
		},
		format_after_save = {
			lsp_format = "fallback",
			async = true,
			timeout_ms = 1000,
		},
	},
	keys = {
		{
			"<leader>mp",
			function()
				require("conform").format({ lsp_format = "fallback", async = false, timeout_ms = 1000 })
			end,
			mode = { "n", "v" },
			desc = "Format file or range",
		},
	},
}
