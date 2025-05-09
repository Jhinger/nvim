return {
	"lewis6991/gitsigns.nvim",
	commit = "3d01bad517a9cd8d6b1ac6871e16188375c2853b",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_line_blame = true,
		signs = {
			delete = {
				show_count = true,
			},
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			map("n", "<leader>gb", function()
				gs.blame_line({ full = true })
			end, "Git Blame line")
		end,
	},
}
