return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("onedark").setup({
			style = "darker",
			transparent = true,
			code_style = {
				comments = "italic",
				functions = "bold",
			},
			lualine = {
				transparent = false,
			},
			colors = {
				lighter_gray = "#75c6d1",
			},
			highlights = {
				["comments"] = { fg = "$ligher_gray", fmt = "none" },
				["@comment"] = { fg = "$lighter_gray", fmt = "none" },
				["@lsp.type.comment"] = { fg = "$lighter_gray", fmt = "none" },
			},
		})

		vim.cmd("colorscheme onedark")
	end,
}
