vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit Insert Mode" })
keymap.set("n", "<S-d>", "dd", { desc = "Delete Current Line" })

-- quit nvim
keymap.set("n", "<leader>q", "<cmd>qa<CR>", { desc = "Quit Vim" })

keymap.set("n", "<S-j>", "5j", { desc = "Up 5 lines" })
keymap.set("n", "<S-k>", "5k", { desc = "Down 5 lines" })

keymap.set("n", "o", "o<ESC>", { desc = "Insert new line below" })
keymap.set("n", "O", "O<ESC>", { desc = "Insert new line above" })

vim.api.nvim_create_user_command("BufDel", function()
	local bufs = vim.fn.getbufinfo({ buflisted = true })
	local current_buf = vim.fn.bufnr()
	if #bufs > 1 then
		vim.cmd("bprevious")
		vim.cmd("bdelete " .. current_buf)
	else
		vim.cmd("Alpha")
		vim.cmd("bdelete " .. current_buf)
	end
end, {})

keymap.set("n", "<leader>tx", ":BufDel<CR>", { desc = "Close current buffer" })
keymap.set("n", "<leader>tl", "<cmd>bnext<CR>", { desc = "Go to the next buffer" })
keymap.set("n", "<leader>th", "<cmd>bprevious<CR>", { desc = "Go to the previous buffer" })

keymap.set("n", "S", "<cmd>w<CR>", { desc = "Save file" })

-- Map Tab and Shift-Tab
vim.api.nvim_set_keymap("i", "<Tab>", "<C-t>", { noremap = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "<C-d>", { noremap = true })
