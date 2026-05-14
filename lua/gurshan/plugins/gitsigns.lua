return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			ignore_whitespace = false,
		},
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
			end, "Git blame line")
			map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
			map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
		end,
	},
}
