return {
	"windwp/nvim-ts-autotag",
	dependencies = "nvim-treesitter/nvim-treesitter",
	opts = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
			},
		})
	end,
}
