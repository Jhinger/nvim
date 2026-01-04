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
					["comments"] = { fg = "$lighter_gray", fmt = "none" },
					["@comment"] = { fg = "$lighter_gray", fmt = "none" },
					["@lsp.type.comment"] = { fg = "$lighter_gray", fmt = "none" },

					SnacksIndent = { fg = "#3b3f4c" }, -- subtle base indent (dark gray)
					SnacksIndentScope = { fg = "#86baba" }, -- lighter teal for current block
				},
		})

		vim.cmd("colorscheme onedark")
	end,
}
