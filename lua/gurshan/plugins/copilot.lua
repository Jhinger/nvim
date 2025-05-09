return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			filetypes = {
				javascript = true,
				typescript = true,
				ruby = true,
				lua = true,
			},
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<S-CR>",
				},
			},
			panel = {
				enabled = false,
			},
		})
	end,
}
