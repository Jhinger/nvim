vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
keymap.set("n", "<S-d>", "dd", { desc = "Delete current line" })

keymap.set("n", "<leader>q", "<cmd>qa<CR>", { desc = "Quit all" })

keymap.set("n", "<S-j>", "5j", { desc = "Move down 5 lines" })
keymap.set("n", "<S-k>", "5k", { desc = "Move up 5 lines" })

keymap.set("n", "o", "o<ESC>", { desc = "New line below" })
keymap.set("n", "O", "O<ESC>", { desc = "New line above" })

keymap.set("n", "S", "<cmd>w<CR>", { desc = "Save file" })

keymap.set("n", "<leader>tx", ":BufDel<CR>", { desc = "Close buffer" })

keymap.set("n", "<leader>el", "<cmd>wincmd l<CR>", { desc = "Focus right panel" })

keymap.set("n", "<leader>tl", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>th", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

vim.api.nvim_create_user_command("BufDel", function()
	local bufs = vim.fn.getbufinfo({ buflisted = true })
	local current_buf = vim.fn.bufnr()
	if #bufs > 1 then
		vim.cmd("bprevious")
		vim.cmd("bdelete " .. current_buf)
	else
		if _G.Snacks and Snacks.dashboard and Snacks.dashboard.open then
			Snacks.dashboard.open()
		else
			vim.cmd("enew")
		end
		vim.cmd("bdelete " .. current_buf)
	end
end, {})
