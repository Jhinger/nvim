return {
	"dmmulroy/ts-error-translator.nvim",
	event = "LspAttach",
	opts = {
		auto_attach = true,
		servers = {
			"ts_ls",
			"svelte",
			"vue_ls",
		},
	},
}
