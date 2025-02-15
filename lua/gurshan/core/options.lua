vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- side numbers
opt.number = true
opt.relativenumber = false

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.softtabstop = 2
opt.cmdheight = 0

-- linewrapping
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if mixed case included, assumes case-sensitive.

opt.termguicolors = true

-- cursorline on normal mode
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	callback = function()
		opt.cursorline = true
	end,
})

-- no cursorline in insert mode
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
	callback = function()
		opt.cursorline = false
	end,
})

opt.background = "dark" -- default to dark mode of a colorscheme
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

-- split windows direction
opt.splitright = true
opt.splitbelow = true
