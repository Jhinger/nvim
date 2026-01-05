return {
	"dmmulroy/ts-error-translator.nvim",
	event = "LspAttach",
	config = function()
		require("ts-error-translator").setup({
			auto_attach = true,
			servers = {
				"ts_ls",
				"svelte",
				"vue_ls",
			},
		})
	end,
}
