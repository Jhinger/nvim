return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true,
			enable_moveright = true,
			enable_afterquote = true,
			enable_check_bracket_func = true,
		})
	end,
}
