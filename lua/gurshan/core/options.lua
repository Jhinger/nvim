local opt = vim.opt

opt.number = true
opt.relativenumber = false

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.softtabstop = 2
opt.cmdheight = 0

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

vim.filetype.add({
	pattern = {
		[".*/templates/.*%.tpl"] = "helm",
		[".*/templates/.*%.ya?ml"] = "helm",
		[".*/templates/.*%.txt"] = "helm",
		["helmfile.*%.ya?ml"] = "helm",
		["helmfile.*%.ya?ml.gotmpl"] = "helm",
		["values.*%.ya?ml"] = "yaml.helm-values",
	},
})

vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	callback = function()
		opt.cursorline = true
	end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
	callback = function()
		opt.cursorline = false
	end,
})
